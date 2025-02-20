module testbench();
    reg [2:0] src0;
    reg [2:0] src2;
    wire [3:0] dst;
    wire [3:0] exp;
    wire test;
    gpc303_4 gpc303_4(
        .src0(src0),
        .src2(src2),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src0[1] * 1 + src0[2] * 1 + src2[0] * 4 + src2[1] * 4 + src2[2] * 4;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, src2:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, src2, dst, exp, test);
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h0;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h4;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h5;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h6;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h7;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h8;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h9;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'ha;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'hb;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'hc;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'hd;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'he;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'hf;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h10;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h11;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h12;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h13;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h14;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h15;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h16;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h17;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h18;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h19;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1a;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1b;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1c;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1d;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1e;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h1f;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h20;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h21;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h22;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h23;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h24;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h25;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h26;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h27;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h28;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h29;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2a;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2b;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2c;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2d;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2e;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h2f;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h30;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h31;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h32;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h33;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h34;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h35;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h36;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h37;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h38;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h39;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3a;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3b;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3c;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3d;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3e;
        #1
        {src2[2], src2[1], src2[0], src0[2], src0[1], src0[0]} <= 6'h3f;
        #1
        $finish();
    end
endmodule
