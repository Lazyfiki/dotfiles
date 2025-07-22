precision mediump float;

uniform sampler2D tex;
uniform float alpha;
uniform vec2 texsize;

void main() {
    vec2 uv = gl_FragCoord.xy / texsize;
    vec4 color = vec4(0.0);

    // Simple box blur: sample 9 neighboring pixels
    float blurSize = 1.0 / texsize.x; // Adjust blur radius
    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            vec2 offset = vec2(float(x), float(y)) * blurSize;
            color += texture2D(tex, uv + offset);
        }
    }
    color /= 9.0; // Average the samples

    // Apply minimum alpha (mimicking ignorealpha 0.5)
    color.a = max(color.a, 0.5) * alpha;

    gl_FragColor = color;
}
