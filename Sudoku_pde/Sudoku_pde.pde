private int levels;
public double easy, medium, hard; 
public String place; 
private boolean set; 
private int[][] solution; 

void setup(){
 
  set = false; 
  easy = 0.5; 
  medium = 0.4; 
  hard = 0.3; 
  place = "loading"; 
  background(255,255,255);
  size(1067,800); 
  PImage load = loadImage("sudoku.png"); 
  image(load,0,-70); 
  PImage play = loadImage("newplay.jpg"); 
  image(play, 425, 650); 
  
  Puzzle temp = new Puzzle(); 
  solution = temp.getGrid();
    
  
}

void Number(float x, float y, int value, color c){
  textSize(45); 
  fill(c); 
  String temp = String.valueOf(value); 
  text(temp, x, y); 
}


    

void draw(){
  if(place.equals("loading")){
    for(int x = 425; x < 642; x++){
      for (int y = 650; y < 730; y++){
        if(mousePressed){
          if(mouseX == x && mouseY == y){
            place = "selection"; 
          }
        }
      }
    }
  }
  if(place.equals("selection")){
    windowResize(1000,662);             
    PImage back = loadImage("sudoku background levels.jpg");
    image(back, 0, 0); 
    rect(200, 150, 600, 100); 
    rect(200, 300, 600, 100); 
    rect(200, 450, 600, 100); 
    textSize(100); 
    fill(0, 255, 0);
    text("EASY", 400, 230); 
    fill(0, 0, 0); 
    text("MEDIUM", 340, 380); 
    fill(255,0, 0); 
    text("HARD", 400, 530); 
    fill(255, 255, 255); 
    for (int x = 200; x < 800; x++){
      for (int y = 150; y < 550; y++){
        if(y == 250){
          y = y + 50; 
        }
        else if (y == 400){
          y = y + 50; 
        }
        else if(mousePressed){
          if(mouseX == x && mouseY == y){
            place = "play"; 
            if(y <= 250){
              levels = 1; 
            }
            else if (y <= 400){
              levels = 2; 
            }
            else{
              levels = 3; 
            }
            
          }
        }
      }
    }
  }
  if(place.equals("play")){
    
      windowResize(800, 800); 
      
      rect(150, 150, 500, 500); 
      for(int j = 0; j < 8; j++){
        line(205.55 + 55.5 * j, 150, 205.55 + 55.5 * j, 650); 
        if(j == 1 || j == 4){
          strokeWeight(5); 
        }
        else{
          strokeWeight(3); 
        }
      }
      for(int j = 0; j < 8; j++){
        line(150, 205.55 + 55.5 * j, 650, 205.55 + 55.5 * j); 
        if(j == 1 || j == 4){
          strokeWeight(5); 
        }
        else{
          strokeWeight(3); 
        }
      }
      rect(230, 50, 315, 50); 
      rect(50, 50, 130, 50); 
      
      rect(620, 50, 130, 50); 
      for(int a = 0; a < 9; a++){
        rect(30 + a * 82.22, 670, 82.22, 82.22); 
      }
      
      textSize(50); 
      fill(0, 0, 0);
      text("HINT", 60, 90);
      text("MISTAKES: 0/3", 240, 90); 
      text("QUIT", 630, 90); 
      textSize(70); 
      text("1", 55, 730); 
      text("2", 137, 730); 
      text("3", 219, 730); 
      text("4", 302, 730); 
      text("5", 384, 730); 
      text("6", 466, 730); 
      text("7", 548, 730); 
      text("8", 631, 730); 
      text("9", 713, 730); 
     
        
        for(int r = 0; r < 9; r++){
          for(int c = 0; c < 9; c++){
            if(levels == 1){
              double tem = Math.random();
              if(tem > easy){
                Number(165 + r * 55.5, 190 + c * 55.5, solution[r][c], 0); 
              }
              
            }
          }
        }
      
    
    
      fill(255,255,255); 
      
    
  }
}
  

  
  
  
  
  
  
  
  
  
  
  
  
 
