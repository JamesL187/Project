class Puzzle{
  int diff; 
  int[][] grid;  
  int[][] box1, box2, box3, box4, box5, box6, box7, box8, box9; 

  
  Puzzle(int difficulty){
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
    diff = difficulty;   
    for(int x = 0; x < grid.length; x++){
      for (int y = 0; y < grid[0].length; y++){
        addRandomNumber(x, y); 
      }
    }
  }
            
  void addRandomNumber(int x, int y){
    
    int[] d = {1,2,3,4,5,6,7,8,9};
    int temp = (int)((grid[0].length)* (Math.random()));
    if(addToBox(x, y, temp) && gridcheck(x, y, temp)){
      grid[x][y] = temp; 
      
    }
    else{
      addRandomNumber(x, y); 
    }
  }
    
            
  boolean addToBox(int x, int y, int v){
    if(x > 3 && y > 3){
      box1[x][y] = v; 
      return boxcheck(box1, v); 
    }
    else if (x > 6 && y > 3){
      box2[x - 3][y] = v; 
      return boxcheck(box2, v); 
    }
    else if (x > 9 && y > 3){
      box3[x - 6][y] = v; 
      return boxcheck(box3, v); 
    }
    else if (x > 3 && y > 6){
      box4[x][y - 3] = v; 
      return boxcheck(box4, v); 
    }
    else if (x > 6 && y > 6){
      box5[x - 3][y - 3] = v; 
      return boxcheck(box5, v); 
    }
    else if (x > 9 && y > 6){
      box6[x - 6][y - 3] = v; 
      return boxcheck(box6, v); 
    }
    else if (x > 3 && y > 9){
      box7[x][y - 6] = v; 
      return boxcheck(box7, v); 
    }
    else if (x > 6 && y > 9){
      box8[x - 3][y - 6] = v; 
      return boxcheck(box8, v); 
    }
    else{
      box9[x - 6][y - 6] = v; 
      return boxcheck(box9, v); 
    }
  }
            
            
  boolean boxcheck(int[][] b, int value){
    for(int x = 0; x < b.length; x++){
      for(int i = 0; i < b[0].length; i++){
        if(b[x][i] == value){
          return false; 
        }
      }
    }
    return true; 
  }
  
  boolean gridcheck(int x, int y, int value){
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (x == i || y == j){
          if (grid[i][j] == value){
            return false; 
          }
        }
      }
    }
    return true; 
  }
}

    
        
