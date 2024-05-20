#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate the texture coordinate to range [-1.0, 1.0]
    vec2 texCoord = 2.0 * model_uv - 1.0;

    // Calculate radius
    float radius = length(texCoord);

    // Calculate texture coordinate offset
    vec2 texCoordOffset = texCoord * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;

    // Calculate final texture coordinate
    vec2 finalTexCoord = model_uv + texCoordOffset;

    // Color
    FragColor = texture(image, finalTexCoord);
}
