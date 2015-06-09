float arm_length = 10;
float quater_of_tau = TAU / 4;

PVector arm_angles = null;

void setup() {
  size(320, 240, P3D);
  
  arm_angles = angles();
}

void draw() {
  background(255);
  
  stroke(0);
  strokeWeight(0.1);
  
  pushMatrix();
  translate(width/2, height/2);
  scale(15);
  rotateZ(-arm_angles.x);
  
  line(0, 0, arm_length, 0);
  translate(arm_length, 0, 0);
  
  pushMatrix();
  rotateZ(-arm_angles.y);
  stroke(255, 0, 0);
  line(0, 0, arm_length, 0);
  popMatrix();
  popMatrix();
}

PVector angles() {
  PVector[] array = new PVector[180*180];
  int array_index = 0;
  PVector point = new PVector(3, 3);
  for (int i = 0; i < 180; i += 1) {
    for(int j = 0; j < 180; j += 1) {  
      float angle_arm1 = i * TAU / 360; 
      float angle_arm2 = j * TAU / 360;
      float x0 = arm_length * cos(angle_arm1 - quater_of_tau);
      float x1 = arm_length * cos(angle_arm2 - quater_of_tau + angle_arm1);
      float x = x0 + x1;
      
      float y0 = arm_length * sin(angle_arm1 - quater_of_tau);
      float y1 = arm_length * sin(angle_arm2 - quater_of_tau + angle_arm1);
      float y = y0 + y1;
      
      PVector result = new PVector(x, y);
      float distance = result.dist(point);
      
      array[array_index] = new PVector(angle_arm1, angle_arm2, distance);
      array_index += 1;
    }
  }
  
  PVector value = new PVector(0, 0, 1e6);
  for (int i = 0; i < array.length; i ++) {
     if (array[i].z < value.z) {
       value = array[i]; 
     }
  }
  
  return value;
}

