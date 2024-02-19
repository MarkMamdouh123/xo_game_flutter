import 'package:flutter/material.dart';

typedef onButtonClickedCallBack = void Function(int index);

class BoardButton extends StatelessWidget {
  BoardButton(
      {super.key,
      required this.sign,
      required this.onButtonClicked,
      required this.index});
  String sign;
  int index;
  onButtonClickedCallBack onButtonClicked;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: MaterialButton(
          onPressed: () {
            onButtonClicked(index);
          },
          child: Text(
            '$sign',
            style: const TextStyle(fontSize: 60, color: Colors.amber),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
