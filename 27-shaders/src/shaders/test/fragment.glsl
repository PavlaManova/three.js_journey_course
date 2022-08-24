varying vec2 vUv;

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

    float strength = step(0.4, mod(vUv.x * 10.0-0.2, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0)) 
                    +
                    step(0.8, mod(vUv.x * 10.0, 1.0)) * step(0.4, mod(vUv.y * 10.0-0.2, 1.0));
    gl_FragColor = vec4(vec3(strength), 1.0);
}