/// @description PN_1D_smoothedNoise(x, seed, wavelength, scale)
/// @param x
/// @param  seed
/// @param  wavelength
/// @param  scale
function PN_1D_smoothedNoise(argument0, argument1, argument2, argument3) {

	argument0 = (argument0/argument2)*argument3;
	return PN_1D_noise(argument0, argument1)/2 + PN_1D_noise(argument0 - 1,argument1)/4 + PN_1D_noise(argument0+1,argument1)/4;



}
