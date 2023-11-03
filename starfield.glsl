// starfield.glsl

precision mediump float;

uniform float time;
uniform vec2 resolution;
uniform vec4 prevFrame;
uniform vec2 parallaxOffset;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  vec3 color = vec3(0.0);

  for (int i = 0; i < 100; i++) {
    float x = float(i) / 100.0;
    float y = fract(sin(float(i) * 12.9898 + time) * 43758.5453);
    vec2 position = vec2(x, y) * 2.0 - 1.0 + parallaxOffset;

    float distance = length(position - uv);
    color += vec3(1.0 - distance * distance) * vec3(y, y, y);
  }

  vec4 currentFrame = vec4(color, 1.0);
  gl_FragColor = mix(prevFrame, currentFrame, 0.1);
}
