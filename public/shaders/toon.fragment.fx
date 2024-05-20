#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Fetch the color from the texture
    vec4 texColor = texture(image, model_uv);
    
    // Round each color component to one of 5 levels
    texColor.rgb = floor(texColor.rgb * 4.0 + 0.5) / 4.0;

    // Output the modified color
    FragColor = texColor;
}
