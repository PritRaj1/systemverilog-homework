//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux (
    input  d0,
    d1,
    input  sel,
    output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module xor_gate_using_mux (
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

  // Intermediate
  logic not_b;

  // ~, but with mux
  mux not_gate (
      .d0 (1'b1),
      .d1 (1'b0),
      .sel(b),
      .y  (not_b)
  );

  mux xor_gate (
      .d0 (b),
      .d1 (not_b),
      .sel(a),
      .y  (o)
  );


endmodule
