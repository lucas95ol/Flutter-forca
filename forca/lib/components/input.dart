import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;

  Input(this.controller);

  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Escreva aqui a letra'),
    );
  }
}
