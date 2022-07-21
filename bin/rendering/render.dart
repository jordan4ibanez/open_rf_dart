import 'dart:math';

import 'package:raylib/raylib.dart';

class Render {

  void draw(Random random) {

    beginDrawing();

    clearBackground(Color(random.nextInt(256), random.nextInt(256), random.nextInt(256), 255));

    endDrawing();
    
  }

}