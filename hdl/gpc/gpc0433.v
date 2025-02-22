module gpc433_5(input [2:0] src0, input [2:0] src1, input [3:0] src2, output [4:0] dst);
    wire [3:0] gene;
    wire [3:0] prop;
    wire [3:0] out;
    wire [3:0] carryout;
    LUT2 #(
        .INIT(4'h8)
    ) lut2_gene0(
        .O(gene[0]),
        .I0(src0[1]),
        .I1(src0[2])
    );
    LUT2 #(
        .INIT(4'h6)
    ) lut2_prop0(
        .O(prop[0]),
        .I0(src0[1]),
        .I1(src0[2])
    );
    LUT3 #(
        .INIT(8'h60)
    ) lut3_gene1(
        .O(gene[1]),
        .I0(src1[0]),
        .I1(src1[1]),
        .I2(src1[2])
    );
    LUT3 #(
        .INIT(8'h96)
    ) lut3_prop1(
        .O(prop[1]),
        .I0(src1[0]),
        .I1(src1[1]),
        .I2(src1[2])
    );
    LUT6_2 #(
        .INIT(64'h8778788778878778)
    ) lut6_2_inst2(
        .O5(gene[2]),
        .O6(prop[2]),
        .I0(src1[0]),
        .I1(src1[1]),
        .I2(src2[1]),
        .I3(src2[2]),
        .I4(src2[3]),
        .I5(src2[0])
    );
    LUT5 #(
        .INIT(32'h80000000)
    ) lut5_gene3(
        .O(gene[3]),
        .I0(src1[0]),
        .I1(src1[1]),
        .I2(src2[1]),
        .I3(src2[2]),
        .I4(src2[3])
    );
    LUT5 #(
        .INIT(32'h7ff8f880)
    ) lut5_prop3(
        .O(prop[3]),
        .I0(src1[0]),
        .I1(src1[1]),
        .I2(src2[1]),
        .I3(src2[2]),
        .I4(src2[3])
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

