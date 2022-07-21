import 'package:raylib/raylib.dart';

import 'dart:io';

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

  initWindow(window.getSizeX(), window.getSizeY(), window.getTitle());

  setTargetFPS(60);

  while(!windowShouldClose()) {
    window.debug();


    beginDrawing();

    clearBackground(Color(255, 0, 0, 255));

    endDrawing();
  }

}
