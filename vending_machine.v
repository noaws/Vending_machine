module vending_machine(rst, clk, T, A, P);
    input rst, clk, T;
    output A, P;
    reg [1:0] state;
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;


    always @(negedge rst)
        A <= 0;
        P <= 0;

    always @(posedge clk)
        case(state)
            S0: if(T)
                    begin
                        state <= S1;
                        A <= 1;
                        p <= 1;
                    end
                else
                    begin
                        state <= S2;
                        A <= 1;
                        P <= 0;
                    end
            S1: if(T)
                    begin
                        state <= S2;
                        A <= 1;
                        p <= 0;
                    end
                else
                    begin
                        state <= S0;
                        A <= 1;
                        P <= 0;
                    end
            S2: if(T)
                    begin
                        state <= S3;
                        A <= 0;
                        p <= 0;
                    end
                else
                    begin
                        state <= S1;
                        A <= 1;
                        P <= 1;
                    end
            S3: if(T)
                    begin
                        state <= S3;
                        A <= 0;
                        p <= 0;
                    end
                else
                    begin
                        state <= S1;
                        A <= 1;
                        P <= 1;
                    end
        endcase

endmodule
