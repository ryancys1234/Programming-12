// Introduction to a 2d array.

int[][] grid; // Denotes a 2d array.

grid = new int[3][3]; // First [] = rows, second [] = columns. Also, every space in the grid is set to 0 by default.

grid[0][0] = 1; // A value of 1 in the first grid.

int row = 0;
int col = 0;
while (row < 3) {
  // Scans through every grid.
  print(grid[row][col]); //Prints the content of each grid.
  col++;
  if (col == 3) {
    col = 0;
    row++;
    println("");
  }
}
