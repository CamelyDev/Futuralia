/// @description PN_1D_interpolatedNoise(x, seed, wavelength, scale)
/// @param x
/// @param  seed
/// @param  wavelength
/// @param  scale
function PN_1D_interpolatedNoise(argument0, argument1, argument2, argument3) {

	argument0 = (argument0/argument2)*argument3;

	var integer_X = floor(argument0);
	var fractional_X = argument0 - integer_X;

	var v1 = PN_1D_smoothedNoise(integer_X, argument1, 1, 1);
	var v2 = PN_1D_smoothedNoise(integer_X + 1, argument1, 1, 1);

	return lerp(v1 , v2 , fractional_X);



}
