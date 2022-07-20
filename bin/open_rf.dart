import 'package:raylib/raylib.dart';
import 'dart:io';

void main() {

  // Get the current running directory of the game.
  final String currentPath = Directory.current.path;

  
  // Initialize the library with enums.
  initLibrary(
    linux: "$currentPath/libraylib.so",
    // Windows is on the todo list
    // windows: '../somewhere/else',
  );

  
}
