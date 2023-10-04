import 'package:flutter/material.dart';

class DetachIconCardButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetachIconCardButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xffeeeeff),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4157ff),
            size: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Colors.black87),
        )
      ],
    ));
  }
}
