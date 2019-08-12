`resetall
`timescale 1ns/1ns


module vending_machine_tb;
    reg RST_n, CLK, T_in;
    wire A_out, P_out;

    vending_machine_m vm1(
        .rst_n(RST_n),
        .clk(CLK),
        .T(T_in),
        .A(A_out),
        .P(P_out)
    );

    always begin
        CLK = 0;
        #20 CLK = 1;
        #5;
    end

    initial begin
        vm1.pstate = 2'b01;
        RST_n = 0; T_in = 0;           // at reset, state = 01
        #10 RST_n = 1;
        @(posedge CLK); T_in = 0;    // nstate = 00
        @(posedge CLK); T_in = 0;    // nstate = 10
        @(posedge CLK); T_in = 1;    // nstate = 11
        @(posedge CLK); T_in = 1;    // nstate = 11
        @(posedge CLK); T_in = 0;    // nstate = 01
        @(posedge CLK); T_in = 0;    // nstate = 00
        @(posedge CLK); T_in = 1;    // nstate = 01
        @(posedge CLK); T_in = 1;    // nstate = 10
        @(posedge CLK); T_in = 0;    // nstate = 01
        #20 RST_n = 0;
    end

endmodule
