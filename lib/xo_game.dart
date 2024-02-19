import 'package:flutter/material.dart';
import 'package:xo_game/board_button.dart';
import 'package:xo_game/home_screen.dart';

class XoScreen extends StatefulWidget {
  static const String routeName = 'xo_game';

  const XoScreen({super.key});

  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  int p1Score = 0;
  int p2Score = 0;
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    GameArg args = ModalRoute.of(context)?.settings.arguments as GameArg;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${args.player1Name} (X)',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      ' Score: $p1Score',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${args.player2Name} (O)',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      ' Score: $p2Score',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    sign: boardState[0], onButtonClicked: onBtnClick, index: 0),
                BoardButton(
                    sign: boardState[1], onButtonClicked: onBtnClick, index: 1),
                BoardButton(
                    sign: boardState[2], onButtonClicked: onBtnClick, index: 2)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  sign: boardState[3],
                  onButtonClicked: onBtnClick,
                  index: 3,
                ),
                BoardButton(
                  sign: boardState[4],
                  onButtonClicked: onBtnClick,
                  index: 4,
                ),
                BoardButton(
                  sign: boardState[5],
                  onButtonClicked: onBtnClick,
                  index: 5,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    sign: boardState[6], onButtonClicked: onBtnClick, index: 6),
                BoardButton(
                    sign: boardState[7], onButtonClicked: onBtnClick, index: 7),
                BoardButton(
                    sign: boardState[8], onButtonClicked: onBtnClick, index: 8)
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  void onBtnClick(int index) {
    setState(() {
      if (boardState[index].isNotEmpty) {
        return;
      }
      if (counter % 2 == 0) {
        boardState[index] = 'X';
      } else {
        boardState[index] = 'O';
      }
      counter++;

      if (checkWinner('X')) {
        p1Score++;
        resetGame();
        counter = 0;
      } else if (checkWinner('O')) {
        p2Score++;
        resetGame();
        counter = 0;
      } else if (counter == 9) {
        resetGame();
        counter = 0;
      }
    });
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void resetGame() {
    boardState = ['', '', '', '', '', '', '', '', ''];
  }
}
