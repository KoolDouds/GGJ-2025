shader_type spatial;
render_mode unshaded;

uniform sampler2D noise : repeat_enable;

void vertex() {
	//VERTEX += NORMAL*0.1*texture(noise,VERTEX.xy*TIME).r;
}

void fragment() {
	ALBEDO.xyz = texture(noise,SCREEN_UV).xyz;
	ALPHA = texture(noise,SCREEN_UV).r;
	ALPHA = step(ALPHA,0.5);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
