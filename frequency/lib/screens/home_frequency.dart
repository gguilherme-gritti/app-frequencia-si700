import 'package:flutter/material.dart';
import 'package:frequency/widgets/calendar_button.dart';
import 'package:frequency/widgets/presence_today_card.dart';

class HomeFrequency extends StatelessWidget {
  const HomeFrequency();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xf6f6f7fb),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black12),
                      child: const Center(
                        child: Icon(
                          Icons.person_rounded,
                          size: 30.0,
                          color: Color(0xFF4157ff),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Text(
                      'Bem vindo, Guilherme!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    CalendarButton(
                      selected: false,
                      weekDay: 'Seg',
                      numberDay: '2',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CalendarButton(
                      selected: false,
                      weekDay: 'Ter',
                      numberDay: '3',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CalendarButton(
                      selected: true,
                      weekDay: 'Qua',
                      numberDay: '4',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CalendarButton(
                      selected: false,
                      weekDay: 'Qui',
                      numberDay: '5',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CalendarButton(
                      selected: false,
                      weekDay: 'Sex',
                      numberDay: '6',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const PresenceTodayCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
