shader_type spatial;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = vec3(0.0,0.5+(sin(TIME*3.0)+1.0)/4.0,1.0);
	float rad = (UV.x* (1.0-UV.x))*(UV.y* (1.0-UV.y))*16.0;
	ALPHA = (cos(rad*20.0+TIME*20.0)+1.0)/2.0*rad*rad;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
