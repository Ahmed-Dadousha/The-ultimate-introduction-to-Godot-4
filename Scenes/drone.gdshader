shader_type canvas_item;

// uniform is keyword that is used to export a variable to GDScript
uniform vec3 color: source_color = vec3(1,1,1);
uniform float progress: hint_range(0.0, 1.0, 0.1) = 0;
// This func is update the position of every single pixel
void vertex() {
	// Called for every vertex the material is visible on.
}

// This func determine the color and the transparency of every single pixel
void fragment() {
	// Called for every pixel the material is visible on.
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(color, current_a), progress);
	COLOR = target_color;
}
