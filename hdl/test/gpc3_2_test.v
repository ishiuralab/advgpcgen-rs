module testbench();
    reg [2:0] src0;
    wire [1:0] dst;
    wire [1:0] exp;
    wire test;
    gpc3_2 gpc3_2(
        .src0(src0),
        .dst(dst)
    );
    assign exp = src0[0] * 1 + src0[1] * 1 + src0[2] * 1;
    assign test = dst == exp;
    initial begin
        $monitor("src0:0x%x, dst:0x%x, exp:0x%x, test:%x", src0, dst, exp, test);
        {src0[2], src0[1], src0[0]} <= 3'h0;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h1;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h2;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h3;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h4;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h5;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h6;
        #1
        {src0[2], src0[1], src0[0]} <= 3'h7;
        #1
        $finish();
    end
endmodule
