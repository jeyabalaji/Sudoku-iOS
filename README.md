# Sudoku-iOS
Sudoku is a number based puzzle which was originated in Japan. It was popularised by the French and American dailies. This sudoku application was developed as per the specifications in the given assignment document of Mobile computing course - fall 2016.

The application has three view controllers. The first view controller is a Launch screen. It will be displayed for 5 seconds when the application is launched. This time is used by the iOS system to initialise all the working components. After this screen is an Instruction viewController. This screen displays some sudoku facts and let the player to start the game. When the user clicks the “Play now” button, the third viewController is triggered. This view controller contains the actual gameplay. 


In the third viewController, A collection view containing 81 tiles is generated. Each tile will have a label to display the number. A sudoku puzzle is generated using a three dimensional array that store the question. There are three 3-dimensional arrays called qnarray[[[]]], ansarray[[[]]], refarray[[[]]]. The qarray[[[]]] stores the question of the sudoku puzzle and ansarray[[[]]] stores the answer elements. The algorithm compares both the arrays to make decision. 


When the user enters the puzzle, he/she is expected to enter the values that are appropriate in the puzzle. When the user fills all the values in the grid, the “Check” button is clicked. This compares the arrays and returns a result whether the user has solved the puzzle correctly or not.   The whole application is designed with a Japanese theme to dedicate and remember the origin of Sudoku. The application was well tested on iPhone 5, iPhone 5s. 
