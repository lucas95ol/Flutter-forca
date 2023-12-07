import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Function()? onPressed;

  LargeButton(this.onPressed);

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('Tentar letra'),
      ),
    );
  }
}
