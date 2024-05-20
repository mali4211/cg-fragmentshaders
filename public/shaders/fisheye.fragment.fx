#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate the texture coordinate to range [-1.0, 1.0]
    vec2 scaled_uv = 2.0 * model_uv - vec2(1.0);

    // Calculate 𝜽 = arctan(texture_coordinate_y, texture_coordinate_x)
    float theta = atan(scaled_uv.y, scaled_uv.x);

    // Calculate radius = magnitude of texture coordinate, raised to the power of 1.5
    float radius = pow(length(scaled_uv), 1.5);

    // Calculate fish eye texture coordinate = (radius * cos(𝜽), radius * sin(𝜽))
    vec2 fish_eye_uv = vec2(radius * cos(theta), radius * sin(theta));

    // Re-scale final texture coordinate in range [0.0, 1.0]
    vec2 final_uv = 0.5 * (fish_eye_uv + 1.0);

    // Get color from original texture using the modified texture coordinate
    FragColor = texture(image, final_uv);
}
