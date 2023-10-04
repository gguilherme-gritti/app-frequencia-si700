import 'package:flutter/material.dart';

class CardIconButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardIconButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1)),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffeeeeff),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF4157ff),
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontFamily: 'Poppins', color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
