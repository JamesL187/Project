class Puzzle{
  int diff; 
  int[9][9] grid; 
  int[3][3] box1, box2, box3, box4, box5, box6, box7, box8, box9; 
  
  
  Puzzle(int difficulty){
    diff = difficulty; 
    ArrayList<Integer> digits = {1,2,3,4,5,6,7,8,9};
    ArrayList<Integer> d = {1,2,3,4,5,6,7,8,9};
    for(int x = 0; x < grid.length; x++){
      for (int i = 0; i < grid[0].length; i++){
        if(x == 0){     
          int temp = (int)((grid[0].length - i)*Math.random());
          grid[0][i] = digits.get(temp);
          if(i > 3){
            box1[x][i] = digits.get(temp); 
          }
          else if(i > 6){
            box2[x][i] = digits.get(temp); 
          }
          else if(i > 9){
            box3[x][i] = digits.get(temp); 
          }
          digits.remove(temp);            
        }
        else{
          for(int z = 0; z < d.length(); z++){
            int tem = (int)((d.length)*Math.random());
            if(boxcheck(
            
  void addToBox(int x, int y, int v){
    if(x > 3 && y > 3){
      box1[x][y] = v; 
    }
    else if (x > 6 && y > 3){
      box2[x - 3][y] = v; 
    }
    else if (x > 9 && y > 3){
      box3[x - 6][y] = v; 
    }
    else if (x > 3 && y > 6){
      box4[x][y - 3] = v; 
    }
    else if (x > 6 && y > 6){
      box5[x - 3][y - 3] = v; 
    }
    else if (x > 9 && y > 6){
      box6[x - 6][y - 3] = v; 
    }
    else if (x > 3 && y > 9){
      box7[x][y - 6] = v; 
    }
    else if (x > 6 && y > 9){
      box8[x - 3][y - 6] = v; 
    }
    else if (x > 9 && y > 9){
      box9[x - 6][y - 6] = v; 
    }
            
            
  boolean boxcheck(int[][] b, int value){
    for(int x = 0; x < b.length; x++){
      for(int i = 0; i < b[0].length; i++){
        if(b[x][i] = value){
          return false; 
        }
      }
    }
    return true; 
  }
        
