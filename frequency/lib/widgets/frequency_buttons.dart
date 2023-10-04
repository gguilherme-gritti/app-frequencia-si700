import 'package:flutter/material.dart';

class FrequencyButtons extends StatelessWidget {
  const FrequencyButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xFFffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            child: const Text('Falta',
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'Poppins')),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xFF4157ff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            child: const Text(
              'Presença',
              style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            ),
          ),
        ),
      ],
    );
  }
}
