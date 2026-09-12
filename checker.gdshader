shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
}

const int count = 10;

void fragment() {
	float value = (floor(UV.x*float(count)) + floor(UV.y*float(count)));
	value = int(value)%2 == 0 ? .2:.8; 
	ALBEDO = vec3(value, value, value);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
