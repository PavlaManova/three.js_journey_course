varying vec2 vUv;

#define PI 3.1415926535897932384626433832795

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void main()
{
    //gradient color from y axis

    //float strength = vUv.y;
    //gl_FragColor = vec4(vec3(strength), 1.0);

    //same but in the other direction

    // float strength = vUv.y;
    // gl_FragColor = vec4(vec3(1.0-strength), 1.0);

    // float strength = vUv.y*5.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = mod(vUv.y*10.0, 1.0);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.5, strength);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    //grid
    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0)) + step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    //dots
    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = -step(0.8, mod(vUv.x * 10.0, 1.0)) + step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);
    //or
    // float strength = step(0.4, mod(vUv.x * 10.0, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.4, mod(vUv.x * 10.0, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0)) 
    //                 +
    //                 step(0.4, mod(vUv.y * 10.0, 1.0)) * step(0.8, mod(vUv.x * 10.0, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.4, mod(vUv.x * 10.0-0.2, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0)) 
    //                 +
    //                 step(0.8, mod(vUv.x * 10.0, 1.0)) * step(0.4, mod(vUv.y * 10.0-0.2, 1.0));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = abs(vUv.x - 0.5);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = min(abs(vUv.x - 0.5),abs( vUv.y - 0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = max(abs(vUv.x - 0.5),abs( vUv.y - 0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.1,max(abs(vUv.x - 0.5),abs( vUv.y - 0.5)));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = step(0.4,max(abs(vUv.x - 0.5),abs( vUv.y - 0.5)));
    // gl_FragColor = vec4(vec3(strength), 1.0);
    // //his solution
    // float strength = step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // strength *= 1.0 - step(0.25, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    //gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = (floor(vUv.x * 10.0) / 10.0 + floor(vUv.y * 10.0) / 10.0) / 2.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);
    // //his solution
    // float strength = floor(vUv.x * 10.0) / 10.0 * floor(vUv.y * 10.0) / 10.0;
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = random(vUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // vec2 gridUv = vec2(floor(vUv.x * 10.0) / 10.0, floor((vUv.y + vUv.x * 0.5) * 10.0) / 10.0);
    // float strength = random(gridUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = length(vUv);
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = 1.0 - distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = 0.015 / (distance(vUv, vec2(0.5)));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    // float strength = 0.15 / (distance(vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    // gl_FragColor = vec4(vec3(strength), 1.0);

    float strength = 0.15 / (distance(vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
    strength *= 0.15 / (distance(vec2(vUv.y, (vUv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));
    gl_FragColor = vec4(vec3(strength), 1.0);
}