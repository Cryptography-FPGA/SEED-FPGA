////////////////////////////////////////////////////////////////////////////////////////////////
//  This source is dedicated to the research paper enttled                                    //
//  "An 8-bit Serialized Architecture of SEED Block Cipher for Constrained Devices"           //
//  on IET Circuits, Devices & Systems journal                                                //
//  Authors : Lampros Pyrgas, Filippos Pirpilidis and Paris Kitsos                            //
//  Institute: University of the Peloponnese                                                  //
//  Department: Electrical and Computer Engineering                                           //
//                                                                                            //
//  This source is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY.  //
////////////////////////////////////////////////////////////////////////////////////////////////

module Compute_store(
    input clk,
    input reset_n,
    input [7:0] data_in,
    input load_store,    
    input enable_output,
    output reg [7:0] F
    );
 
reg [31:0] shift_32_f;

    
always @ ( posedge clk or negedge reset_n ) begin
      if(!reset_n)begin
        shift_32_f <= 0;
        F <= 0;
      end else if(load_store) begin
        shift_32_f <= {data_in,shift_32_f[31:8]};
      end else if(enable_output) begin
        F <= shift_32_f[7:0];
        shift_32_f <= {8'h00,shift_32_f[31:8]};
      end
    end          
    
endmodule
