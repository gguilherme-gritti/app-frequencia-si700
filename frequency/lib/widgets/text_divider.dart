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
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
