module testbench();
    reg [2:0] src0;
    reg [3:0] src1;
    reg [0:0] src2;
    wire [3:0] dst;
    wire [3:0] exp;
    wire test;
    gpc143_4 gpc143_4(
        .src0(src0),
        .src1(src1),
        .src2(src2),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src0[1] * 1 + src0[2] * 1 + src1[0] * 2 + src1[1] * 2 + src1[2] * 2 + src1[3] * 2 + src2[0] * 4;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, src1:0x%x, src2:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, src1, src2, dst, exp, test);
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h10;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h11;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h12;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h13;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h14;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h15;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h16;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h17;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h18;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h19;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h1f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h20;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h21;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h22;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h23;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h24;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h25;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h26;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h27;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h28;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h29;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h2f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h30;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h31;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h32;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h33;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h34;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h35;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h36;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h37;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h38;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h39;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h3f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h40;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h41;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h42;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h43;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h44;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h45;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h46;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h47;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h48;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h49;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h4f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h50;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h51;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h52;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h53;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h54;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h55;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h56;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h57;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h58;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h59;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h5f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h60;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h61;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h62;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h63;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h64;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h65;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h66;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h67;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h68;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h69;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h6f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h70;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h71;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h72;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h73;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h74;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h75;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h76;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h77;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h78;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h79;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h7f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h80;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h81;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h82;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h83;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h84;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h85;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h86;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h87;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h88;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h89;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h8f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h90;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h91;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h92;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h93;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h94;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h95;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h96;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h97;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h98;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h99;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9a;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9b;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9c;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9d;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9e;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'h9f;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'ha9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'haa;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hab;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hac;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'had;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hae;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'haf;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hb9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hba;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hbb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hbc;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hbd;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hbe;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hbf;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hc9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hca;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hcb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hcc;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hcd;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hce;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hcf;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hd9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hda;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hdb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hdc;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hdd;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hde;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hdf;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'he9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hea;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'heb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hec;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hed;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hee;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hef;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf0;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf1;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf2;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf3;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf4;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf5;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf6;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf7;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf8;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hf9;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hfa;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hfb;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hfc;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hfd;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hfe;
        #1
        {src2[0], src1[3], src1[2], src1[1], src1[0], src0[2], src0[1], src0[0]} <= 8'hff;
        #1
        $finish();
    end
endmodule
