import './style.css'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import * as dat from 'lil-gui'

/**
 * Base
 */
// Debug
const gui = new dat.GUI()

// Canvas
const canvas = document.querySelector('canvas.webgl')

// Scene
const scene = new THREE.Scene()

//fog
const fog = new THREE.Fog('#262867', 1, 15);
scene.fog = fog;

/**
 * Textures
 */
const textureLoader = new THREE.TextureLoader()
const doorColorTexture = textureLoader.load('/textures/door/color.jpg');
const doorAlphaTexture = textureLoader.load('/textures/door/alpha.jpg');
const doorAmbientOcclusionTexture = textureLoader.load('/textures/door/ambientOcclusion.jpg')
const doorHeightTexture = textureLoader.load('/textures/door/height.jpg');
const doorNormalTexture = textureLoader.load('/textures/door/normal.jpg');
const doorMetalnessTexture = textureLoader.load('/textures/door/metalness.jpg');
const doorRoughnessTexture = textureLoader.load('/textures/door/roughness.jpg');

const bricksColorTexture = textureLoader.load('/textures/bricks/color.jpg');
const bricksAmbientOcclusionTexture = textureLoader.load('/textures/bricks/ambientOcclusion.jpg');
const bricksNormalTexture = textureLoader.load('/textures/bricks/normal.jpg');
const bricksRoughnessTexture = textureLoader.load('/textures/bricks/roughness.jpg');

/**
 * House
 */
const house = new THREE.Group();
scene.add(house);

//walls
const wallsWidth = 4;
const wallsHeight = 2.5;
const walls = new THREE.Mesh(
    new THREE.BoxGeometry(wallsWidth, wallsHeight, wallsWidth),
    new THREE.MeshStandardMaterial(
    {
        map: bricksColorTexture,
        aoMap: bricksAmbientOcclusionTexture,
        transparent: true,
        normalMap: bricksNormalTexture,
        roughnessMap: bricksRoughnessTexture,
    }
    ));

walls.geometry.setAttribute(
    'uv2',
    new THREE.Float32BufferAttribute(walls.geometry.attributes.uv.array,2));

    walls.position.y += wallsHeight/2;
house.add(walls);

//roof
const roofR = wallsWidth;
const roofHeight = 1.5;
const roof = new THREE.Mesh(
    new THREE.ConeGeometry(roofR, roofHeight, 4),
    new THREE.MeshStandardMaterial({
        color: '#b35f45'
    })
);

roof.position.y += roofHeight/2 + wallsHeight;
roof.rotation.y = Math.PI/4;
house.add(roof);


//door
const doorSize = 2.2;
const door = new THREE.Mesh(
    new THREE.PlaneGeometry(doorSize, doorSize, 100, 100),
    new THREE.MeshStandardMaterial({ 
        map: doorColorTexture,
        alphaMap: doorAlphaTexture,
        transparent: true,
        aoMap: doorAmbientOcclusionTexture,
        displacementMap: doorHeightTexture,
        displacementScale: 0.1,
        normalMap: doorNormalTexture,
        metalnessMap: doorMetalnessTexture,
        roughnessMap: doorRoughnessTexture,
    })
)

door.geometry.setAttribute(
    'uv2',
    new THREE.Float32BufferAttribute(door.geometry.attributes.uv.array,2));
door.position.y += doorSize/2;
door.position.z += wallsWidth/2+0.01;
house.add(door);

//bushes
const bushR = 0.5;
const bushGeometry = new THREE.SphereGeometry(bushR,32,32);
const bushMaterial = new THREE.MeshStandardMaterial({ color: '#89c854'});

const bush = new THREE.Mesh(bushGeometry, bushMaterial);
bush.scale.set(0.9,0.7,0.9);
bush.position.set(THREE.Math.randFloat(doorSize/2,wallsWidth/2-0.2), bushR*0.8-0.1, wallsWidth/2 + 0.5);

const bush2 = bush.clone();
bush2.position.x = -THREE.Math.randFloat(doorSize/2,wallsWidth/2-0.2);
bush2.position.z = wallsWidth/2 + 0.5;
bush2.scale.set(0.4,0.8,0.4);

const bush3 = bush2.clone();
bush3.scale.y = 0.5;
bush3.position.x = THREE.Math.randFloat(doorSize/2,wallsWidth/2-0.2);

const bush4 = bush.clone();
bush4.position.x = -THREE.Math.randFloat(doorSize/2,wallsWidth/2-0.2);
scene.add(bush, bush2, bush3, bush4);

//Graves
var graveHeight = 1;
function createGrave()
{
    const graveLength = 0.8;
    // const graveHeight = 1;
    const graveWidth = 0.1;
    const grave = new THREE.Group();
    const graveMaterial = new THREE.MeshLambertMaterial({color: '#7C7C7C'});
    const base = new THREE.Mesh(new THREE.BoxGeometry(graveLength, graveHeight, graveWidth), 
                    graveMaterial);
    base.position.set(2,2,3);
    grave.add(base);

    const arch = new THREE.Mesh(
        new THREE.CylinderGeometry(graveLength/2,graveLength/2, graveWidth, 16, 16),
        graveMaterial
    );
    grave.add(arch);
    arch.rotation.x = Math.PI/2;
    arch.position.copy(base.position);
    arch.position.y += graveHeight/2;
    //scene.add(grave);
    return grave;
}

const gravesCount = 60;
for(let i=0; i<gravesCount; i++)
{
    const grave = createGrave();
    grave.position.setFromSphericalCoords(THREE.Math.randFloat(wallsWidth*Math.sqrt(2),18),Math.PI/2,THREE.Math.randFloat(0,2*Math.PI));
    grave.position.y -= graveHeight*3/2 + 0.3;
    grave.rotation.z = THREE.Math.randFloat(-Math.PI/18, Math.PI/18);
    scene.add(grave);
}


// Ground
const floor = new THREE.Mesh(
    new THREE.CircleGeometry(22, 22),
    new THREE.MeshStandardMaterial({ color: '#a9c388' })
)
floor.rotation.x = - Math.PI * 0.5
floor.position.y = 0
scene.add(floor)

/**
 * Lights
 */
// Ambient light
const ambientLight = new THREE.AmbientLight('#b9d5ff', 0.12)
gui.add(ambientLight, 'intensity').min(0).max(1).step(0.001)
scene.add(ambientLight)

// Directional light
const moonLight = new THREE.DirectionalLight('#b9d5ff', 0.12)
moonLight.position.set(4, 5, - 2)
gui.add(moonLight, 'intensity').min(0).max(1).step(0.001)
gui.add(moonLight.position, 'x').min(- 5).max(5).step(0.001)
gui.add(moonLight.position, 'y').min(- 5).max(5).step(0.001)
gui.add(moonLight.position, 'z').min(- 5).max(5).step(0.001)
scene.add(moonLight)

//door light
const doorLight = new THREE.PointLight('#ff7d46',1,7);
doorLight.position.set(0,wallsWidth/2,wallsHeight);
house.add(doorLight);


/**
 * Sizes
 */
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
}

window.addEventListener('resize', () =>
{
    // Update sizes
    sizes.width = window.innerWidth
    sizes.height = window.innerHeight

    // Update camera
    camera.aspect = sizes.width / sizes.height
    camera.updateProjectionMatrix()

    // Update renderer
    renderer.setSize(sizes.width, sizes.height)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
})

/**
 * Camera
 */
// Base camera
const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height, 0.1, 100)
camera.position.x = 4
camera.position.y = 2
camera.position.z = 5
scene.add(camera)

// Controls
const controls = new OrbitControls(camera, canvas)
controls.enableDamping = true

/**
 * Renderer
 */
const renderer = new THREE.WebGLRenderer({
    canvas: canvas
})
renderer.setSize(sizes.width, sizes.height)
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))

renderer.setClearColor('#262867');

/**
 * Animate
 */
const clock = new THREE.Clock()

const tick = () =>
{
    const elapsedTime = clock.getElapsedTime()

    // Update controls
    controls.update()

    // Render
    renderer.render(scene, camera)

    // Call tick again on the next frame
    window.requestAnimationFrame(tick)
}

tick()