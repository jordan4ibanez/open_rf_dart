// Window handling class
import 'package:raylib/raylib.dart';

/*
reminder on how to control window states
if (isWindowState(ConfigFlags.windowResizable)) {
  clearWindowState(ConfigFlags.windowResizable);
} else {
 setWindowState(ConfigFlags.windowResizable);
}
*/


class Window {

  int sizeX = 0;
  int sizeY = 0;
  double aspect = 0;
  String title = "";

  Window (this.sizeX, this.sizeY, this.title){
    aspect = sizeX.toDouble() / sizeY.toDouble();
  }

  void resize(int sizeX, int sizeY) {
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    aspect = sizeX.toDouble() / sizeY.toDouble();
  }

  int getSizeX() {
    return sizeX;
  }

  int getSizeY() {
    return sizeY;
  }

  List getSize() {
    return [sizeX, sizeY];
  }

  double getAspect() {
    return aspect;
  }

  String getTitle() {
    return title;
  }

  // Regular polling during the update loop
  void update() {
    bool resized = isWindowResized();

    if (resized) {
      updateInternalSize();
    }
  }

  // Internal calculator - Probably redundant
  void updateInternalSize() {

    bool fullScreen = isWindowState(ConfigFlags.fullscreenMode);

    int currentMonitor = getCurrentMonitor();


    if (fullScreen) {
      int width = getMonitorWidth(currentMonitor);
      int height = getMonitorHeight(currentMonitor);
      resize(width, height);
    } else {
      int width = getScreenWidth();
      int height = getScreenHeight();
      resize(width, height);
    }

    debug();
  }

  // only used for debug
  void debug() {
    print("SizeX: $sizeX | SizeY: $sizeY | Aspect: $aspect");
  }

}