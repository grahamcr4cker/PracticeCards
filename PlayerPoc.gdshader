shader_type canvas_item;

// Uniforms
uniform vec3 outline_color : source_color = vec3(1.0, 0.0, 0.0); // The color of the outline (in R, G, B, A format)

void vertex() {
    // No vertex manipulation needed for 2D canvas item shaders
}

void fragment() {
    // The original texture color of the sprite
    vec4 original_color = texture(TEXTURE, UV);

    // The threshold to detect edges (you can adjust this value)
    float edge_threshold = 0.1;

    // Calculate the difference between the original and neighboring pixel colors
    float dFdx_r = dFdx(original_color.r);
    float dFdy_r = dFdy(original_color.r);
    float dFdx_g = dFdx(original_color.g);
    float dFdy_g = dFdy(original_color.g);
    float dFdx_b = dFdx(original_color.b);
    float dFdy_b = dFdy(original_color.b);

    // Calculate the magnitude of the gradient
    float gradient = length(vec2(dFdx_r, dFdy_r)) + length(vec2(dFdx_g, dFdy_g)) + length(vec2(dFdx_b, dFdy_b));

    // Check if the pixel is an edge and apply the outline color if it is
    if (gradient > edge_threshold) {
        COLOR = vec4(outline_color, 1.0);
    } else {
        COLOR = original_color;
    }
}