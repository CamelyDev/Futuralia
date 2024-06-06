var bl = blocks[curblock].Copy();
bl.pos = new vector2(x div BS, y div BS);
ds_grid_set(blockGrid,x div BS, abs(y div BS),bl);
var inst = instance_create_layer(bl.pos.x * BS,bl.pos.y * BS,"Blocks",oSolid);
inst.index = block_gen(bl);
curstate = CURSORSTATE.CONFIRM;
fpi = FPI_MAX;