module vending_machine_m(
    input wire rst_n,
    input wire clk,
    input wire T,
    output reg A,
    output reg P
);


    reg [1:0] pstate, nstate;
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;


    always @(T or pstate)
        case(pstate)
            S0: if(T) begin nstate = S1; A = 1; P = 1; end
                else begin nstate = S2; A = 1; P = 0; end
            S1: if(T) begin nstate = S2; A = 1; P = 0; end
                else begin nstate = S0; A = 1; P = 0; end
            S2: if(T) begin nstate = S3; A = 0; P = 0; end
                else begin nstate = S1; A = 1; P = 1; end
            S3: if(T) begin nstate = S3; A = 0; P = 0; end
                else begin nstate = S1; A = 1; P = 1; end
        endcase

    always @(posedge clk)
        if(!rst_n) nstate <= S1;
        else pstate <= nstate;

endmodule
