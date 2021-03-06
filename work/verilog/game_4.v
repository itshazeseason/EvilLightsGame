/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_4 (
    input clk,
    input rst,
    input [6:0] sw,
    output reg [6:0] sevenseg,
    output reg [4:0] p1score,
    output reg [4:0] p2score,
    output reg [4:0] led,
    output reg [47:0] debug
  );
  
  
  
  reg [15:0] wdata;
  
  reg zflag;
  
  reg [15:0] alu_b;
  
  reg [6:0] seg;
  
  wire [16-1:0] M_regf_out_a;
  wire [16-1:0] M_regf_out_b;
  wire [64-1:0] M_regf_outp;
  wire [16-1:0] M_regf_debug;
  reg [4-1:0] M_regf_write_address;
  reg [1-1:0] M_regf_we;
  reg [16-1:0] M_regf_data;
  reg [4-1:0] M_regf_read_address_a;
  reg [4-1:0] M_regf_read_address_b;
  reg [16-1:0] M_regf_inp;
  regfile_6 regf (
    .clk(clk),
    .rst(rst),
    .write_address(M_regf_write_address),
    .we(M_regf_we),
    .data(M_regf_data),
    .read_address_a(M_regf_read_address_a),
    .read_address_b(M_regf_read_address_b),
    .inp(M_regf_inp),
    .out_a(M_regf_out_a),
    .out_b(M_regf_out_b),
    .outp(M_regf_outp),
    .debug(M_regf_debug)
  );
  
  wire [4-1:0] M_ctrlunit_regfile_write_address;
  wire [4-1:0] M_ctrlunit_regfile_read_address_a;
  wire [4-1:0] M_ctrlunit_regfile_read_address_b;
  wire [1-1:0] M_ctrlunit_we_regfile;
  wire [16-1:0] M_ctrlunit_literal;
  wire [6-1:0] M_ctrlunit_alufn;
  wire [1-1:0] M_ctrlunit_bsel;
  wire [1-1:0] M_ctrlunit_outsel;
  reg [1-1:0] M_ctrlunit_z;
  ctrl_7 ctrlunit (
    .clk(clk),
    .rst(rst),
    .z(M_ctrlunit_z),
    .regfile_write_address(M_ctrlunit_regfile_write_address),
    .regfile_read_address_a(M_ctrlunit_regfile_read_address_a),
    .regfile_read_address_b(M_ctrlunit_regfile_read_address_b),
    .we_regfile(M_ctrlunit_we_regfile),
    .literal(M_ctrlunit_literal),
    .alufn(M_ctrlunit_alufn),
    .bsel(M_ctrlunit_bsel),
    .outsel(M_ctrlunit_outsel)
  );
  
  wire [16-1:0] M_aluunit_out;
  wire [1-1:0] M_aluunit_z;
  wire [1-1:0] M_aluunit_v;
  wire [1-1:0] M_aluunit_n;
  reg [16-1:0] M_aluunit_a;
  reg [16-1:0] M_aluunit_b;
  reg [6-1:0] M_aluunit_alufn;
  alu_16_8 aluunit (
    .a(M_aluunit_a),
    .b(M_aluunit_b),
    .alufn(M_aluunit_alufn),
    .out(M_aluunit_out),
    .z(M_aluunit_z),
    .v(M_aluunit_v),
    .n(M_aluunit_n)
  );
  
  always @* begin
    
    case (M_ctrlunit_bsel)
      1'h0: begin
        alu_b = M_regf_out_b;
      end
      1'h1: begin
        alu_b = M_ctrlunit_literal;
      end
      default: begin
        alu_b = M_regf_out_b;
      end
    endcase
    M_aluunit_a = M_regf_out_a;
    M_aluunit_b = alu_b;
    M_aluunit_alufn = M_ctrlunit_alufn;
    
    case (alu_b[0+3-:4])
      1'h0: begin
        seg = 7'h3f;
      end
      1'h1: begin
        seg = 7'h06;
      end
      2'h2: begin
        seg = 7'h5b;
      end
      2'h3: begin
        seg = 7'h4f;
      end
      3'h4: begin
        seg = 7'h66;
      end
      3'h5: begin
        seg = 7'h6d;
      end
      3'h6: begin
        seg = 7'h7d;
      end
      3'h7: begin
        seg = 7'h07;
      end
      4'h8: begin
        seg = 7'h7f;
      end
      4'h9: begin
        seg = 7'h67;
      end
      4'ha: begin
        seg = 7'h77;
      end
      4'hb: begin
        seg = 7'h7c;
      end
      4'hc: begin
        seg = 7'h39;
      end
      4'hd: begin
        seg = 7'h5e;
      end
      4'he: begin
        seg = 7'h79;
      end
      4'hf: begin
        seg = 7'h71;
      end
      default: begin
        seg = 1'h0;
      end
    endcase
    
    case (M_ctrlunit_outsel)
      1'h0: begin
        wdata = M_aluunit_out;
      end
      1'h1: begin
        wdata = {9'h000, seg};
      end
      default: begin
        wdata = M_aluunit_out;
      end
    endcase
    M_regf_read_address_a = M_ctrlunit_regfile_read_address_a;
    M_regf_read_address_b = M_ctrlunit_regfile_read_address_b;
    M_regf_we = M_ctrlunit_we_regfile;
    M_regf_write_address = M_ctrlunit_regfile_write_address;
    M_regf_data = wdata;
    M_regf_inp = {9'h000, sw};
    sevenseg = M_regf_outp[0+0+6-:7];
    p1score = M_regf_outp[16+0+4-:5];
    p2score = M_regf_outp[32+0+4-:5];
    led = M_regf_outp[48+0+4-:5];
    zflag = (~|wdata);
    M_ctrlunit_z = zflag;
    debug[0+15-:16] = M_regf_out_b;
    debug[16+15-:16] = M_regf_out_a;
    debug[32+15-:16] = M_regf_debug;
  end
endmodule
