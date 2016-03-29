import 'dart:html';
import 'dart:math';

void main() {
  query("#surface")
    ..onClick.listen(drawFern);
  drawBarnsleyFern();
}

void drawFern(MouseEvent event) {
  drawBarnsleyFern();
}

void drawBarnsleyFern() {
  CanvasElement surface = query("#surface");
  CanvasRenderingContext2D crc = surface.getContext("2d");
  double x = 0.0;
  double y = 0.0;
  double nextx = 0.0;
  double nexty = 0.0;  
  double plotDecider = 0.0;
  Random rng = new Random();
  
  x = rng.nextDouble();
  y = rng.nextDouble();
  crc.fillStyle = "#000000";
  crc.fillRect(0, 0, 999, 999);
  for (int i=0;i<50000;i++){
    
    plotDecider = rng.nextDouble();
    
    if (plotDecider<0.01)
    {
      x = 0.0;
      y = 0.16 * y;
    }
    else if (plotDecider < 0.86)
    {
      nextx = (0.85 * x) + (0.04 * y);
      nexty = (0.04 * x) + (0.85 * y) + 1.6;
      x = nextx;
      y = nexty;
    }
    else if (plotDecider < 0.92) {
      nextx = (0.2 * x) - (0.26 * y);
      nexty = (0.23 * x) + (0.22 * y) + 1.6;
      x = nextx;
      y = nexty;
    }
    else{
      nextx = (-0.15 * x) + (0.28 * y);
      nexty = (0.26 * x) + (0.24 * y) + 0.44;
      x = nextx;
      y = nexty;
                
    }
    
    int col = 100 + rng.nextInt(143);
    crc.fillStyle = "rgb(0,$col,00)";
    crc.fillRect(100 + (x*50).toInt(), 500 - (y*40).toInt(), 1, 1);
  }
}
