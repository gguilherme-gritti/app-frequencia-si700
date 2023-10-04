import 'package:flutter/material.dart';

class CalendarButton extends StatelessWidget {
  final bool selected;
  final String numberDay;
  final String weekDay;

  const CalendarButton(
      {required this.selected, required this.numberDay, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: selected
              ? Border.all(color: Colors.black12, width: 1.0)
              : Border.all(color: const Color(0xf6f6f7fb), width: 1.0),
          color: selected ? Colors.white : const Color(0xf6f6f7fb),
          borderRadius: const BorderRadius.all(Radius.circular(32))),
      child: Center(
        child: Column(
          children: [
            Text(
              numberDay,
              style: TextStyle(
                  color: selected ? const Color(0xFF4157ff) : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Poppins'),
            ),
            Text(
              weekDay,
              style: TextStyle(
                  color: selected ? const Color(0xFF4157ff) : Colors.black38,
                  fontSize: 10,
                  fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
    );
  }
}
