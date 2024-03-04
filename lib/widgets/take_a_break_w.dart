import 'dart:async';
import 'package:e_learning_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TakeABreakW());
}

class TakeABreakW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>> board =
      List.generate(3, (i) => List.generate(3, (j) => ""));
  bool isPlayerXTurn = true;
  int moves = 0;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    setState(() {
      board = List.generate(3, (i) => List.generate(3, (j) => ""));
      isPlayerXTurn = true;
      moves = 0;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == "") {
      setState(() {
        board[row][col] = isPlayerXTurn ? "X" : "O";
        isPlayerXTurn = !isPlayerXTurn;
        moves++;

        if (checkWinner(row, col)) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Winner is ${board[row][col]}!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      startNewGame();
                      showThankYouMessage();
                    },
                    child: Text('New game'),
                  ),
                ],
              );
            },
          );
        } else if (moves == 9) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('TIE!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      startNewGame();
                      showThankYouMessage();
                    },
                    child: Text('New game'),
                  ),
                ],
              );
            },
          );
        } else if (!isPlayerXTurn) {
          // If it's computer's turn, make a move after a delay
          Timer(Duration(milliseconds: 300), () {
            makeComputerMove();
          });
        }
      });
    }
  }

  bool checkWinner(int row, int col) {
    // Check row
    if (board[row].every((element) => element == board[row][col])) {
      return true;
    }

    // Check column
    if (board.every((element) => element[col] == board[row][col])) {
      return true;
    }

    // Check diagonals
    if (row == col &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      return true;
    }

    if (row + col == 2 &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      return true;
    }

    return false;
  }

  void makeComputerMove() {
    // Simple implementation: Computer makes a move to try to win
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          board[i][j] = "O";
          if (checkWinner(i, j)) {
            // If the computer wins, show the dialog and start a new game
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Winner is ${board[i][j]}!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        startNewGame();
                        showThankYouMessage();
                      },
                      child: Text('New game'),
                    ),
                  ],
                );
              },
            );
          } else {
            // If the computer didn't win, continue the game
            setState(() {
              isPlayerXTurn = !isPlayerXTurn;
              moves++;
            });
          }
          return;
        }
      }
    }

    // If the computer can't win, it plays a random move
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          board[i][j] = "O";
          setState(() {
            isPlayerXTurn = !isPlayerXTurn;
            moves++;
          });
          return;
        }
      }
    }
  }

  void startNewGame() {
    setState(() {
      initializeGame();
    });
  }

  void showThankYouMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank you for playing. Now you can return to learning.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF0000),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () => makeMove(row, col),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: board[row][col] == "X"
                          ? const Color(0xFFFF0000)
                          : board[row][col] == "O"
                              ? const Color(0xFFFF0000)
                              : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 9,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: startNewGame,
            child: Text(
              'New game',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
