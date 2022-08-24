uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;
attribute float aRandom;

varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position,1.0);

    float radius = modelPosition.x * modelPosition.x + modelPosition.y * modelPosition.y;
           
        modelPosition.z += sin(modelPosition.x*radius*5.0)*0.5;
    

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vRandom = aRandom;
}