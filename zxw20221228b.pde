import geomerative.*;

RShape   grp;
RShape   circle;

boolean ignoringStyles = false;

void setup() {
  size(600, 600);
  smooth();

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);

  String txt="LIGHT AND SHADOW";


  grp = RG.getText(txt, "sjtu2022-zhangxinwen.ttf", 66, RG.CENTER);


  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizerAngle(0.065);
  grp = RG.polygonize(grp);

  circle = RG.getEllipse(0, 0, 40);
  circle = RG.centerIn(circle, g, 200);
}

void draw() {
  translate(width/2, height/2);
  background(#E0DAF0);

  float cR=map(mouseX, 0, width, 0, 255);
  fill(cR);
  stroke(0);

  float t = map(mouseY, 0, height, 0.01, 0.99);
  RShape circleSeg = RG.split(circle, t)[0];

  RG.setAdaptor(RG.BYELEMENTPOSITION);
  RShape adaptedGrp = RG.adapt(grp, circleSeg);

  RG.shape( adaptedGrp );

  noFill();
  stroke(178,169,240);

  RG.shape( circleSeg );
}

void mousePressed() {
  ignoringStyles = !ignoringStyles;
  RG.ignoreStyles(ignoringStyles);
}
