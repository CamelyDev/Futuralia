/// @description PN_1D_noise(x, seed)
/// @param x
/// @param  seed
function PN_1D_noise(argument0, argument1) {
	var oldseed = argument1;
	random_set_seed(floor(argument0)+argument1);
	var val = random_range(-1,1);
	random_set_seed(oldseed);
	return val;
	


}
