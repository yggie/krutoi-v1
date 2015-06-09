PImage img;

void setup() {
  size(600,600);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("fun_pic.jpg");
  //img.resize(600,600);
  img.filter(GRAY);
  
  img.loadPixels();
  int pix_number = img.width * img.height;
  for (int i = 0; i < pix_number; i += 1) { 
    float grey = red(img.pixels[i]); 
    if(grey < 100){
      img.pixels[i] = color(0);     
    }  else {
      img.pixels[i] = color(255);
    }    
  }
  img.updatePixels();
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  image(img,0,0);
}

