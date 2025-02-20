module testbench();
    reg [0:0] src0;
    reg [4:0] src1;
    reg [0:0] src2;
    wire [3:0] dst;
    wire [3:0] exp;
    wire test;
    gpc151_4 gpc151_4(
        .src0(src0),
        .src1(src1),
        .src2(src2),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src1[0] * 2 + src1[1] * 2 + src1[2] * 2 + src1[3] * 2 + src1[4] * 2 + src2[0] * 4;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, src1:0x%x, src2:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, src1, src2, dst, exp, test);
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h0;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h8;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h9;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'ha;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'hb;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'hc;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'hd;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'he;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'hf;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h10;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h11;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h12;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h13;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h14;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h15;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h16;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h17;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h18;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h19;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h1f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h20;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h21;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h22;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h23;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h24;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h25;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h26;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h27;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h28;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h29;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h2f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h30;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h31;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h32;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h33;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h34;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h35;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h36;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h37;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h38;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h39;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h3f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h40;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h41;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h42;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h43;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h44;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h45;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h46;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h47;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h48;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h49;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h4f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h50;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h51;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h52;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h53;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h54;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h55;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h56;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h57;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h58;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h59;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h5f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h60;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h61;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h62;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h63;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h64;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h65;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h66;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h67;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h68;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h69;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h6f;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h70;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h71;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h72;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h73;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h74;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h75;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h76;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h77;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h78;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h79;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7a;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7b;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7c;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7d;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7e;
        #1
        {src2[0], src1[4], src1[3], src1[2], src1[1], src1[0], src0[0]} <= 7'h7f;
        #1
        $finish();
    end
endmodule
