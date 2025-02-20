module testbench();
    reg [0:0] src0;
    reg [0:0] src1;
    reg [2:0] src2;
    wire [3:0] dst;
    wire [3:0] exp;
    wire test;
    gpc311_4 gpc311_4(
        .src0(src0),
        .src1(src1),
        .src2(src2),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src1[0] * 2 + src2[0] * 4 + src2[1] * 4 + src2[2] * 4;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, src1:0x%x, src2:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, src1, src2, dst, exp, test);
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h0;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h2;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h3;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h4;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h5;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h6;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h7;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h8;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h9;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'ha;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'hb;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'hc;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'hd;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'he;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'hf;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h10;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h11;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h12;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h13;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h14;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h15;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h16;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h17;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h18;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h19;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1a;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1b;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1c;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1d;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1e;
        #1
        {src2[2], src2[1], src2[0], src1[0], src0[0]} <= 5'h1f;
        #1
        $finish();
    end
endmodule
