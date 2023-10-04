import 'package:flutter/material.dart';

class CardIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;

  const CardIconButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
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
