Perceptron brain;

Point[] points = new Point[100];


int trainingIndex = 0;
void setup(){
 size(800, 800);
 brain = new Perceptron(3);
 
 for (int i =0; i < points.length;i++){
   points[i] = new Point();
 }
 
}


void draw() {
  background(255);
  stroke(0);
  //line(0,height,width, 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixelX(),p1.pixelY(), p2.pixelX(), p2.pixelY());
  //float x1 = -1;
  //float y1 = f(x1);
  //float x2 = 1;
  //float y2 = f(x2);
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.pixelX(),p3.pixelY(), p4.pixelX(), p4.pixelY());
  
  for (Point pt : points){
    pt.show();
  }
   //we wanna send every point as inputs, x and y. Send them to train function.
  for (Point pt: points){
    float[] inputs= {pt.x, pt.y, pt.bias};
    int target = pt.label;
    //brain.train(inputs, target); 
    
    int guess = brain.guess(inputs);
    if(guess == target){
      fill(0,255,0);
    }else {
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 16,16);
  }
  
  Point trainig = points[trainingIndex];
  float[] inputs= {trainig.x, trainig.y, trainig.bias};
  int target = trainig.label;
  brain.train(inputs, target); 
  // move between the training sets
  trainingIndex++;
  //if it gets to the end, set it to 0
  if (trainingIndex == points.length){
    trainingIndex = 0;
  }
}

void mousePressed(){
  for (Point pt: points){
    //float[] inputs= {pt.x, pt.y};
    //int target = pt.label;
    //brain.train(inputs, target); 
  }
}
