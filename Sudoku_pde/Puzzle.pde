class Puzzle{
  public int[][] grid;  
  public int[][] print; 
  private double diff; 

  
  Puzzle(double difficulty){
    this.grid = new int[9][9]; 
    print = new int[9][9]; 
    diff = difficulty; 
    ArrayList<Integer> temp = new ArrayList<Integer>();
    temp.add(1); 
    temp.add(2); 
    temp.add(3); 
    temp.add(4); 
    temp.add(5); 
    temp.add(6); 
    temp.add(7); 
    temp.add(8); 
    temp.add(9); 
    for(int x = 1; x <= 9; x++){
      int ran = rand(9 - x); 
      int tem = temp.get(ran); 
      temp.remove(ran); 
      addNumber(tem, 0);
        
    }
    for(int x = 0; x < 9; x++){
      for(int i = 0; i < 9; i++){
        double pro = Math.random(); 
        if(pro < diff){
          print[x][i] = grid[x][i]; 
        }
      }
    }
    
    
  }
   
  int[][] getGrid(){
  return this.grid; 
  }
  int[][] getPrint(){
    return this.print; 
  }
  
  boolean addNumber(int value, int row){     
    if(row == 9){
      return true; 
    }
    else{      
      for(int x = 0; x < 9; x++){
        if(grid[row][x] == 0 && safe(row, x, value)){
          grid[row][x] = value; 
          if(addNumber(value, row + 1)){           
            return true; 
          }
          else{
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
  
  boolean safe(int row, int col, int v){
    return boxcheck(row, col, v) && rowcheck(row, v) && colcheck(col, v); 
  }
    
            
 
            
  boolean boxcheck(int row, int col, int v){
    for(int x = (row - row % 3); x < (row - row % 3) + 3; x++){
      for(int i = (col - col % 3); i < (col - col % 3) + 3; i++){
        if(grid[x][i] == v){
          return false; 
        }     
      }
    }
    return true; 
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

    
        
