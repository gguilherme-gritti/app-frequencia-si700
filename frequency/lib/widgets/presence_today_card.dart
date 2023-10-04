import 'package:flutter/material.dart';
import 'package:frequency/widgets/frequency_buttons.dart';
import 'package:frequency/widgets/text_divider.dart';

class PresenceTodayCard extends StatelessWidget {
  const PresenceTodayCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.white),
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: const BoxDecoration(
              color: Color(0xf6f6f7fb),
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: const Center(
            child: Icon(
              Icons.calendar_today,
              color: Color(0xFF4157ff),
              size: 70,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Marque sua frequência de hoje!',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const TextDivider(text: 'SI700A'),
        ),
        const FrequencyButtons(),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: const TextDivider(text: 'SI010A'),
        ),
        const FrequencyButtons(),
      ]),
    );
  }
}
