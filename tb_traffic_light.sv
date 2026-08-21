module tb_traffic_light;

  reg clk, rst_n;
  wire red, yellow, green;

  // Connect to traffic light
  traffic_light dut (
    .clk(clk),
    .rst_n(rst_n),
    .red(red),
    .yellow(yellow),
    .green(green)
  );

  // Clock
  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    // Initialise
    clk = 0; rst_n = 0;

    // Reset
    #10 rst_n = 1;

    // Wait long enough to see full cycle
    // GREEN(5) + YELLOW(2) + RED(5) = 12 cycles x 10 time units = 120
    // Run 2 full cycles
    #240;

    $finish;
