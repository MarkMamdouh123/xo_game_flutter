import 'package:flutter/material.dart';
import 'package:xo_game/xo_game.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  String player1Name = '';
  String player2Name = '';

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                player1Name = value;
              },
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22),
              maxLength: 15,
              decoration: InputDecoration(
                label: const Text(
                  'Player 1 name',
                  style: TextStyle(fontSize: 30),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value) {
                player2Name = value;
              },
              style: const TextStyle(fontSize: 22),
              maxLength: 15,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: const Text(
                  'Player 2 name',
                  style: TextStyle(fontSize: 30),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                Navigator.pushNamed(context, XoScreen.routeName,
                    arguments: GameArg(
                        player1Name: player1Name, player2Name: player2Name));
              },
              child: const Text('GO',
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class GameArg {
  String player1Name;
  String player2Name;
  GameArg({required this.player1Name, required this.player2Name});
}
