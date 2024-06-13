private int levels;
public double easy, medium, hard; 
public String place; 
private boolean set; 
private int[][] prin; 
private int[][] solution; 
public float holder; 
public int mistakes; 
public int score; 
public int[] highestScores; 
public boolean win; 

void setup(){
  win = false; 
  score = 0; 
  highestScores = new int[3]; 
  mistakes = 0; 
  set = false; 
  easy = 0.5; 
  medium = 0.4; 
  hard = 0.3; 
  place = "win"; 
  holder = 0; 
  background(255,255,255);
  size(1067,800); 
  PImage load = loadImage("sudoku.png"); 
  image(load,0,-70); 
  PImage play = loadImage("newplay.jpg"); 
  image(play, 425, 650);   
}

void mousePressed(){
  int ran1 = (int)(Math.random() * 9); 
  int ran2 = (int)(Math.random() * 9); 
  
  if(place.equals("play")){
    if(mouseX >= 50 && mouseX <= 180 && mouseY >= 50 && mouseY <= 100){    
      prin[ran1][ran2] = solution[ran1][ran2]; //hint button
    }    
    if(mouseX >= 620 && mouseX <= 750 && mouseY >= 50 && mouseY <= 100){
      place = "selection";  //quit button
      set = false; 
      mistakes = 0; 
    }
    if(mouseX >= 30 && mouseX <= 770 && mouseY >= 670 && mouseY <= 752.22){
      holder = (int)((mouseX - 30)/82.22) + 1; 
    }
    if(mouseX >= 770 && mouseX <= 980 && mouseY >= 640 && mouseY <= 752.22){
      holder = 10; 
    }
    if(holder != 0){
      if(mouseX >= 150 && mouseX <= 650 && mouseY >= 150 && mouseY <= 650){
        int r = int((mouseX - 150) / 55.55);
        int c = int((mouseY - 150) / 55.55); 
        if(holder != 10){
          prin[r][c] = int(holder); 
          holder = 0; 
          score += 10; 
          if(prin[r][c] != solution[r][c]){
            mistakes++; 
            score = score - 20; 
            if(mistakes == 3){
            place = "lose"; 
            set = false; 
            mistakes = 0; 
            levels = 0; 
            score = 0; 
            }   
          }
        }
        else if(holder == 10){
          prin[r][c] = 0; 
          holder = 0; 
        }
      }
    }
  }
  if(place.equals("lose") || place.equals("win")){
    if(mousePressed){
      place = "selection"; 
      levels = 0; 
    }
  }
}

  
  

void Number(float x, float y, int value, color c){
  textSize(45); 
  fill(c); 
  String temp = String.valueOf(value); 
  text(temp, x, y); 
}


void puzz(boolean set){
  if (!set){
    if(levels == 1){
      Puzzle temp = new Puzzle(easy); 
      solution = temp.getGrid();
      prin = temp.getPrint(); 
      
    }
    if(levels == 2){
      Puzzle temp = new Puzzle(medium); 
      solution = temp.getGrid();
      prin = temp.getPrint(); 
    }
    if(levels == 3){
      Puzzle temp = new Puzzle(hard); 
      solution = temp.getGrid();
      prin = temp.getPrint(); 
    } 
  }
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
      windowResize(1000, 800);     
      background(255,255,255);
      rect(150, 150, 500, 500); //sudoku box
      rect(700, 200, 250, 300); // scores
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
      rect(230, 50, 315, 50); //mistakes
      rect(50, 50, 130, 50); //hint      
      rect(620, 50, 130, 50); //quit
      for(int a = 0; a < 10; a++){
        if(a < 9){
          rect(30 + a * 82.22, 670, 82.22, 82.22); //numbers
        }
        else if (a == 9){
          rect(30 + a * 82.22, 640, 210, 112.22); //erase
        }
      }
      textSize(35); 
      fill(0, 0, 0);
      text("Best Scores: " , 710, 230); 
      text("Current Score: ", 710, 420); 
      textSize(45); 
      fill(0, 0, 0); 
      text("1. " + highestScores[0], 710, 280); 
      text("2. " + highestScores[1], 710, 330); 
      text("3. " + highestScores[2], 710, 380); 
      text("" + score, 710, 460); 
      textSize(50); 
      fill(0, 0, 0);
      text("HINT", 60, 90);
      text("MISTAKES:" + mistakes + "/3", 240, 90); 
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
      textSize(75); 
      text("ERASE", 772, 720); 
      puzz(set); 
      set = true;      
      for(int r = 0; r < 9; r++){
        for(int c = 0; c < 9; c++){
            if(prin[r][c] != 0 && prin[r][c] == solution[r][c]){
              Number(165 + r * 55.5, 190 + c * 55.5, prin[r][c], 0);                     
            }
            else if(prin[r][c] != 0 && prin[r][c] != solution[r][c]){
              color wrong = color(255, 0, 0); 
              Number(165 + r * 55.5, 190 + c * 55.5, prin[r][c], wrong);   
              
            }
        }
      }
      fill(255,255,255);      
      
     
      win = true; 
      for(int x = 0; x < 9; x++){
        for(int i = 0; i < 9; i++){
          if(prin[x][i] == 0){
            win = false; 
          }
        }
      }
      if(win){
        place = "win"; 
      }
          
  }
   
  if(place.equals("lose")){    
    PImage lose = loadImage("lose.png"); 
    image(lose, 0, 0); 
    set = false; 
    mistakes = 0; 
    textSize(50); 
    text("Press to play again", 330, 700);
   }
   if(place.equals("win")){
     windowResize(1024, 768); 
     PImage dub = loadImage("win.jpg"); 
     image(dub, 0, 0); 
     win = false; 
     mistakes = 0; 
     set = false; 
     int placeholder = score;
     int lowest = 0; 
     textSize(50); 
     text("Press to play again", 350, 650); 
     for(int x = 0; x < 3; x++){
       if (placeholder > highestScores[x]){
         lowest = highestScores[x]; 
         highestScores[x] = placeholder; 
         placeholder = lowest;
       }
     }
     score = 0; 
         
   }
   
  
}
  

  
  
  
  
  
  
  
  
  
  
  
  
 
