module gpc71_4(input [0:0] src0, input [6:0] src1, output [3:0] dst);
    wire [2:0] gene;
    wire [2:0] prop;
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
    LUT6_2 #(
        .INIT(64'h6996966996696996)
    ) lut6_2_inst1(
        .O5(gene[1]),
        .O6(prop[1]),
        .I0(src1[2]),
        .I1(src1[3]),
        .I2(src1[4]),
        .I3(src1[5]),
        .I4(src1[6]),
        .I5(src1[1])
    );
    LUT5 #(
        .INIT(32'he8808000)
    ) lut5_gene2(
        .O(gene[2]),
        .I0(src1[2]),
        .I1(src1[3]),
        .I2(src1[4]),
        .I3(src1[5]),
        .I4(src1[6])
    );
    LUT5 #(
        .INIT(32'h177e7ee8)
    ) lut5_prop2(
        .O(prop[2]),
        .I0(src1[2]),
        .I1(src1[3]),
        .I2(src1[4]),
        .I3(src1[5]),
        .I4(src1[6])
    );
    CARRY4 carry4_inst0(
        .CO(carryout[3:0]),
        .O(out[3:0]),
        .CYINIT(1'h0),
        .CI(src0[0]),
        .DI({1'h0, gene[2:0]}),
        .S({1'h0, prop[2:0]})
    );
    assign dst = {carryout[2], out[2], out[1], out[0]};
endmodule

