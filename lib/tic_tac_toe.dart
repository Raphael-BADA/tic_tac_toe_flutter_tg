import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/players.dart';
import 'package:tic_tac_toe/components/stats.dart';
import 'package:tic_tac_toe/utils.dart';
import 'package:tic_tac_toe/widget/tic_tac_container.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<Piece> pieces = [];
  int currentPlayer = 1;
  int currentIndex = 0;
  int putPiecescount = 0;
  int player1WinCount = 0;
  int player2WinCount = 0;
  int rounds = 0;

  int? removedIndex;

  List<List> winCouples = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ];
  List<Color?> borderColors = List.generate(9, (index) => null);

  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            context.vert3,
            Expanded(
                child: Players(
                    player1WinCount: player1WinCount,
                    player2WinCount: player2WinCount)),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: context.widthPercent(2),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: context.widthPercent(2),
                  crossAxisSpacing: context.widthPercent(2),
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                      onTap: () {
                        if (gameOver == false) {
                          removeOrPutPiece(index);
                        }
                      },
                      child: TicTacToeContainer(
                        piece: pieces[index],
                        borderColor: borderColors[index],
                      ));
                },
              ),
            ),
            Expanded(
              child: Center(
                child: gameOver == false
                    ? Text(
                        "PLAYER $currentPlayer TURN !",
                        style: TextStyle(
                          fontSize: context.t2,
                          color: Colors.white70,
                        ),
                      )
                    : Text(
                        "PLAYER ${currentPlayer == 1 ? "2" : "1"} WON !",
                        style: TextStyle(
                          fontSize: context.t1,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
              ),
              // child: Center(
              //     child: Stats(
              //         player1WinCount: player1WinCount,
              //         player2WinCount: player2WinCount,
              //         rounds: rounds)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(2),
              ),
              child: Divider(),
            ),
            context.vert2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    endGame();
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: context.widthPercent(12),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    reset();
                  },
                  icon: Icon(
                    Icons.restart_alt,
                    color: Colors.blue,
                    size: context.widthPercent(12),
                  ),
                ),
              ],
            ),
            context.vert2,
          ],
        ),
      ),
    );
  }

  void startGame() {
    setState(() {
      pieces = List.generate(9, (index) => Piece.empty);
    });
  }

  void endGame() {
    setState(() {
      pieces = List.generate(9, (index) => Piece.empty);
      player1WinCount = 0;
      player2WinCount = 0;
      rounds = 0;
    });
  }

  void reset() {
    setState(() {
      pieces = List.generate(9, (index) => Piece.empty);
      currentPlayer = 1;
      currentIndex = 0;
      putPiecescount = 0;
      removedIndex = null;
      gameOver = false;
    });
  }

  void putPiece(int index) {
    if (pieces.where((element) => element == Piece.empty).length > 3 &&
        removedIndex != index) {
      setState(() {
        currentIndex = index;
        pieces[index] = currentPlayer == 1 ? Piece.triangle : Piece.circle;
        currentPlayer = currentPlayer == 1 ? 2 : 1;
        putPiecescount += 1;
      });
      if (putPiecescount > 6) {
        checkWin();
      }
    } else {
      error(index);
    }
  }

  void removeOrPutPiece(int index) {
    if (pieces[index] == Piece.empty) {
      putPiece(index);
    } else {
      if (checkIfSelectedCaseIsForcurrentuser(index)) {
        if (pieces.where((element) => element == Piece.empty).length == 3) {
          removepiece(index);
        } else {
          error(index);
        }
      } else {
        error(index);
      }
    }
  }

  bool checkIfSelectedCaseIsForcurrentuser(int index) {
    if ((currentPlayer == 1 && pieces[index] == Piece.triangle) ||
        (currentPlayer == 2 && pieces[index] == Piece.circle)) {
      return true;
    }
    return false;
  }

  void removepiece(int index) {
    setState(() {
      pieces[index] = Piece.empty;
      removedIndex = index;
    });
  }

  void checkWin() {
    try {
      List<int> positions = [];
      Piece piece = currentPlayer == 2 ? Piece.triangle : Piece.circle;
      for (var i = 0; i < pieces.length; i++) {
        if (pieces[i] == piece) {
          positions.add(i);
        }
      }
      print(winCouples);
      print(positions);
      for (int i = 0; i < winCouples.length; i++) {
        if (winCouples[i][0] == positions[0] + 1 &&
            winCouples[i][1] == positions[1] + 1 &&
            winCouples[i][2] == positions[2] + 1) {
          setState(() {
            gameOver = true;
            if (currentPlayer == 1) {
              player2WinCount += 1;
            } else {
              player1WinCount += 1;
            }
            rounds += 0;
          });
        }
      }
      print(gameOver);
      print(currentPlayer);
    } catch (e) {
      print("e");
      print(e);
    }
  }

  error(int index) async {
    print("noo");
    setState(() {
      borderColors[index] = Colors.red;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      borderColors[index] = null;
    });
  }
}
