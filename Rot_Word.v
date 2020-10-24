module Rot_Word(
    input [0:31] INPUT,
    output [0:31] OUTPUT
    );

assign OUTPUT = {INPUT[8:15], INPUT[16:23], INPUT[24:31], INPUT[0:7]};

endmodule