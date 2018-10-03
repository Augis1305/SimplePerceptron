int sign(float n ){
  if(n >= 0){
    return 1; 
  } else {
    return -1;
  }
}

class Perceptron{
  float[] weights;
  float lr = 0.1;
  //Constructor
  Perceptron(int n){
    weights = new float[n];
    for (int i = 0; i < weights.length; i++){
      weights[i] = random(-1,1);
    }
  }
  
  int guess(float[] inputs){
    float sum = 0;
    for (int i = 0; i < weights.length; i++){
      sum += inputs[i]* weights[i];
    } 
    int output = sign(sum);
    return output;
  }
  
  void train (float[] inputs, int target){
    int guess = guess(inputs);
    int error = target - guess;
    
    //put the data in and get the result if the result is right, if not tweak the data and try again.
    for (int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x) {
    float m = weights[1] / weights[0];
    float b = weights[2];
    return m* x +b;
  }
  
}
