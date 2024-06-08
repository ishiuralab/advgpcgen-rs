module gpc7_3(input [6:0] src0, output [2:0] dst);
    wire [1:0] gene;
    wire [1:0] prop;
    wire [3:0] out;
    wire [3:0] carryout;
    LUT6_2 #(
        .INIT(64'h6996966996696996)
    ) lut6_2_inst0(
        .O5(gene[0]),
        .O6(prop[0]),
        .I0(src0[2]),
        .I1(src0[3]),
        .I2(src0[4]),
        .I3(src0[5]),
        .I4(src0[6]),
        .I5(src0[1])
    );
    LUT5 #(
        .INIT(32'he8808000)
    ) lut5_gene1(
        .O(gene[1]),
        .I0(src0[2]),
        .I1(src0[3]),
        .I2(src0[4]),
        .I3(src0[5]),
        .I4(src0[6])
    );
    LUT5 #(
        .INIT(32'h177e7ee8)
    ) lut5_prop1(
        .O(prop[1]),
        .I0(src0[2]),
        .I1(src0[3]),
        .I2(src0[4]),
        .I3(src0[5]),
        .I4(src0[6])
    );
    CARRY4 carry4_inst0(
        .CO(carryout[3:0]),
        .O(out[3:0]),
        .CYINIT(1'h0),
        .CI(src0[0]),
        .DI({2'h0, gene[1:0]}),
        .S({2'h0, prop[1:0]})
    );
    assign dst = {carryout[1], out[1], out[0]};
endmodule
