import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/widgets/calendar_button.dart';
import 'package:frequency/widgets/management_card.dart';
import 'package:frequency/widgets/presence_today_card.dart';
import 'package:intl/intl.dart';

class HomeFrequency extends StatelessWidget {
  const HomeFrequency();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffeeeeff),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30),
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                return Column(
                  children: [
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
                        welcome(state),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: buildCalendarButtons(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PresenceTodayCard(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
            ),
            const ManagementCard()
          ],
        ),
      ),
    );
  }

  Widget welcome(UserState state) {
    Widget child = const Text(
      'Bem vindo!',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    );
    if (state is LoadingUser) {
      if (state.load) {
        child = CircularProgressIndicator();
      }
    } else if (state is UserData) {
      final name = state.user.name;

      child = Text(
        'Bem vindo, $name!',
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
      );
    }

    return child;
  }

  List<Widget> buildCalendarButtons() {
    DateTime currentDate = DateTime.now();

    List<Widget> calendarButtons = [];

    for (int i = -2; i <= 2; i++) {
      DateTime date = currentDate.add(Duration(days: i));
      String weekDay = DateFormat.E('pt_BR')
          .format(date); // Utilizando intl package para obter o nome do dia
      String numberDay = DateFormat.d().format(date);

      calendarButtons.add(CalendarButton(
        selected: i == 0, // Marcar o dia atual como selecionado
        weekDay: weekDay,
        numberDay: numberDay,
      ));

      if (i < 2) {
        calendarButtons.add(SizedBox(width: 5));
      }
    }

    return calendarButtons;
  }
}
