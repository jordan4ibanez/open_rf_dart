// Window handling class
class Window {

  int sizeX = 0;
  int sizeY = 0;
  double aspect = 0;

  Window (this.sizeX, this.sizeY){
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

  void debug() {
    print("SizeX: $sizeX | SizeY: $sizeY | Aspect: $aspect");
  }

}