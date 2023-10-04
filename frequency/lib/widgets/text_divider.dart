import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.grey[300], // Cor do Divider
            thickness: 1, // Espessura do Divider
          ),
        ),
        const SizedBox(width: 15), // Espaçamento entre o Divider e o texto
        Text(
          text,
          style: const TextStyle(
            fontSize: 16, // Tamanho da fonte do texto
          ),
        ),
        const SizedBox(width: 15), // Espaçamento entre o texto e o Divider
        Expanded(
          child: Divider(
            color: Colors.grey[300], // Cor do Divider
            thickness: 1, // Espessura do Divider
          ),
        ),
      ],
    );
  }
}
