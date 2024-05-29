private int levels;
public int easy, medium, hard; 
public String place; 

void setup(){
  easy = 50; 
  medium = 40; 
  hard = 30; 
  place = "loading"; 
  background(255,255,255);
  size(1067,800); 
  PImage load = loadImage("sudoku.png"); 
  image(load,0,-70); 
  PImage play = loadImage("newplay.jpg"); 
  image(play, 425, 650); 
  
  
    
  
}

void draw(){
  for(int x = 425; x < 642; x++){
    for (int y = 650; y < 730; y++){
      if(mousePressed && place.equals("loading")){
        if(mouseX == x && mouseY == y){
        place = "selection"; 
        windowResize(1000,662); 
        PImage back = loadImage("sudoku background levels.jpg");
        image(back, 0, 0); 
        }
      }
    }
  }
  
  
  
  
  
  
  
  
}
  
void play(){
  
  
  
  
  
  
  
  
  
  
  
  
 
