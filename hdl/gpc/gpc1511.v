module gpc1511_5(input [0:0] src0, input [0:0] src1, input [4:0] src2, input [0:0] src3, output [4:0] dst);
    wire [3:0] gene;
    wire [3:0] prop;
    wire [3:0] out;
    wire [3:0] carryout;
    LUT1 #(
        .INIT(2'h2)
    ) lut1_gene0(
        .O(gene[0]),
        .I0(src1[0])
    );
    LUT1 #(
        .INIT(2'h0)
    ) lut1_prop0(
        .O(prop[0]),
        .I0(src1[0])
    );
    LUT1 #(
        .INIT(2'h2)
    ) lut1_gene1(
        .O(gene[1]),
        .I0(src2[0])
    );
    LUT1 #(
        .INIT(2'h0)
    ) lut1_prop1(
        .O(prop[1]),
        .I0(src2[0])
    );
    LUT4 #(
        .INIT(16'h9600)
    ) lut4_gene2(
        .O(gene[2]),
        .I0(src2[1]),
        .I1(src2[2]),
        .I2(src2[3]),
        .I3(src2[4])
    );
    LUT4 #(
        .INIT(16'h6996)
    ) lut4_prop2(
        .O(prop[2]),
        .I0(src2[1]),
        .I1(src2[2]),
        .I2(src2[3]),
        .I3(src2[4])
    );
    LUT4 #(
        .INIT(16'he800)
    ) lut4_gene3(
        .O(gene[3]),
        .I0(src2[1]),
        .I1(src2[2]),
        .I2(src2[3]),
        .I3(src3[0])
    );
    LUT4 #(
        .INIT(16'h17e8)
    ) lut4_prop3(
        .O(prop[3]),
        .I0(src2[1]),
        .I1(src2[2]),
        .I2(src2[3]),
        .I3(src3[0])
    );
    CARRY4 carry4_inst0(
        .CO(carryout[3:0]),
        .O(out[3:0]),
        .CYINIT(1'h0),
        .CI(src0[0]),
        .DI(gene[3:0]),
        .S(prop[3:0])
    );
    assign dst = {carryout[3], out[3], out[2], out[1], out[0]};
endmodule

