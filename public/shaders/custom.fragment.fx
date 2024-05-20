#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec4 color = texture(image, model_uv);
    
    // Calculate the luminance of the original color
    float luminance = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;

    // Enhance brightness and apply a green tint
    luminance = clamp(luminance * 1.5, 0.0, 1.0); // Boost luminance and clamp to [0,1]
    vec3 nightVisionColor = vec3(0.1, luminance, 0.1); // Create a greenish tint

    FragColor = vec4(nightVisionColor, 1.0);
}
