class Puzzle{
  private int[][] grid;  
  private int[][] box1, box2, box3, box4, box5, box6, box7, box8, box9; 

  
  Puzzle(){
    grid = new int[9][9]; 
    box1 = new int[3][3]; 
    box2 = new int[3][3]; 
    box3 = new int[3][3]; 
    box4 = new int[3][3]; 
    box5 = new int[3][3]; 
    box6 = new int[3][3]; 
    box7 = new int[3][3]; 
    box8 = new int[3][3]; 
    box9 = new int[3][3];  

    for(int x = 1; x <= 2; x++){
      addNumber(x, 0); 
    }
    
  }
   
  int[][] getGrid(){
  return this.grid; 
  }
  
  boolean addNumber(int value, int row){     
    if(row == grid.length){
      return true; 
    }
    else{      
      for(int x = 0; x < grid[0].length; x++){
        if(addToBox(row, x, value) && gridcheck(row, x, value) && grid[row][x] == 0){
          grid[row][x] = value; 
          if(addNumber(value, row + 1)){        
            return true; 
          }
          else{
            removeFromBox(row, x); 
            grid[row][x] = 0; 
          }
        }
      }
    }
    return false;       
  }
  
  int rand(int x){
    return (int)(Math.random() * x); 
  }
  
 void removeFromBox(int x, int y){
   if(x < 3 && y < 3){
      box1[x][y] = 0; 
    }
    
    else if (x < 3 && y < 6){
      box4[x][y - 3] = 0; 
    }
    else if (x  < 3 && y < 9){
      box7[x][y - 6] = 0; 
    }    
    else if (x < 6 && y < 3){
      box2[x - 3][y] = 0; 
    }
    else if (x < 6 && y < 6){
      box5[x - 3][y - 3] = 0; 
    }
    else if (x < 6 && y < 9){
      box8[x - 3][y - 6] = 0; 
    }
    else if (x < 9 && y < 3){
      box3[x - 6][y] = 0; 
    }
    else if (x < 9 && y < 6){
      box6[x - 6][y - 3] = 0; 
    }
    else {
      box9[x - 6][y - 6] = 0; 
    }
 }
    
            
  boolean addToBox(int x, int y, int v){
    if(x < 3 && y < 3){
      box1[x][y] = v; 
      return boxcheck(box1, v); 
    }
    
    else if (x < 3 && y < 6){
      box4[x][y - 3] = v; 
      return boxcheck(box4, v); 
    }
    else if (x  < 3 && y < 9){
      box7[x][y - 6] = v; 
      return boxcheck(box7, v); 
    }    
    else if (x < 6 && y < 3){
      box2[x - 3][y] = v; 
      return boxcheck(box2, v); 
    }
    else if (x < 6 && y < 6){
      box5[x - 3][y - 3] = v; 
      return boxcheck(box5, v); 
    }
    else if (x < 6 && y < 9){
      box8[x - 3][y - 6] = v; 
      return boxcheck(box8, v); 
    }
    else if (x < 9 && y < 3){
      box3[x - 6][y] = v; 
      return boxcheck(box3, v); 
    }
    else if (x < 9 && y < 6){
      box6[x - 6][y - 3] = v; 
      return boxcheck(box6, v); 
    }
    else {
      box9[x - 6][y - 6] = v; 
      return boxcheck(box9, v); 
    }
  }
            
            
  boolean boxcheck(int[][] b, int value){
    int counter = 0; 
    for(int x = 0; x < b.length; x++){
      for(int i = 0; i < b[0].length; i++){
        if(b[x][i] == value){
          counter ++; 
          
        }
        if(counter > 1){
          return false; 
        }
      }
    }
    return true; 
  }
  
  boolean gridcheck(int x, int y, int value){
    return rowcheck(x, value) && colcheck(y, value); 
  }
  
  boolean rowcheck(int x, int value){
    for(int i = 0; i < grid[x].length; i++){
      if(grid[x][i] == value){
        return false; 
      }
    }
    return true; 
  }
  boolean colcheck(int y, int value){
    for(int i = 0; i < grid.length; i++){
      if(grid[i][y] == value){
        return false; 
      }
    }
    return true; 
  }
}

    
        
