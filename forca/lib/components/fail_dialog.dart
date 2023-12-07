import 'package:flutter/material.dart';

class FailDialog extends StatelessWidget {
  final String palavra;
  final Function()? onPressed;

  FailDialog(this.palavra, this.onPressed);

  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Text('Você perdeu, a palavra era: $palavra'),
        ElevatedButton(
          onPressed: onPressed,
          child: Text('ok'),
        )
      ],
    );
  }
}
