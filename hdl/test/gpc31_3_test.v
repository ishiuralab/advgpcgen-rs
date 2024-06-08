module testbench();
    reg [0:0] src0;
    reg [2:0] src1;
    wire [2:0] dst;
    wire [2:0] exp;
    wire test;
    gpc31_3 gpc31_3(
        .src0(src0),
        .src1(src1),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src1[0] * 2 + src1[1] * 2 + src1[2] * 2;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, src1:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, src1, dst, exp, test);
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h0;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h1;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h2;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h3;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h4;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h5;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h6;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h7;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h8;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'h9;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'ha;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'hb;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'hc;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'hd;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'he;
        #1
        {src1[2], src1[1], src1[0], src0[0]} <= 4'hf;
        #1
        $finish();
    end
endmodule
