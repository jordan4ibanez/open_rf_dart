import 'dart:math';

import 'package:raylib/raylib.dart';

import 'dart:io';

import 'rendering/render.dart';
import 'windowing/window.dart';

void main() {

  // Version number
  const versionNumber = "0.0.0";

  // Get the current running directory of the game.
  final String currentPath = Directory.current.path;

  
  // Initialize the library with enums.
  initLibrary(
    linux: "$currentPath/libraylib.so",
    // Windows is on the todo list
    // windows: '../somewhere/else',
    // Mac is currently unsupported
  );

  // Window object
  Window window = Window(800, 400, "Open RF $versionNumber");

  // Render object
  Render render = Render();

  // Random object
  Random random = Random(DateTime.now().millisecondsSinceEpoch);

  initWindow(window.getSizeX(), window.getSizeY(), window.getTitle());

  setWindowState(ConfigFlags.windowResizable);

  setTargetFPS(60);

  Model fish = loadModel("$currentPath/models/rainbowtrout.obj");
  Texture fishTexture = loadTexture("$currentPath/models/rainbowtrout.png");
  fish.materials[0].maps[materialMapDiffuse].texture = fishTexture;
  


  //fishMaterial.maps[materialMapDiffuse].texture = fishTexture;
  

  int counter = 0;

  final camera = Camera3D(
    position: Vector3( 0.0, 10.0, 10.0 ),
    target: Vector3.zero(),
    up: Vector3( 0.0, 1.0, 0.0),
    fovy: 45
  );

  while(!windowShouldClose()) {

    double delta = getFrameTime();

    // Event/engine calls
    window.update();


    counter += 1;

    if (counter >= 180) {
      toggleFullscreen();

      if (isWindowState(ConfigFlags.fullscreenMode)) {
        setCameraMode(camera, CameraMode.orbital);
        camera.target.x = 0;
        camera.target.y = 0;
        camera.target.z = 0;
      } else {
        setCameraMode(camera, CameraMode.firstPerson);
      }

      counter = 0;
    }



    // Render calls
    // render.draw(random);

    updateCamera(camera);


    // camera.target.y += delta * 10;

    beginDrawing();

    clearBackground(Color(255, 255, 255, 255));

    beginMode3D(camera);

    //drawCube(Vector3.zero(), 2, 2, 2, Color.red);

    drawModel(fish, Vector3(2, 2, 2), 1, Color.rayWhite);


    endMode3D();


    // drawText("hi there", 0, 0, 24, Color.black);

    
    endDrawing();
    
    
    // --- Repeat ----->
  }

}
