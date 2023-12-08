import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_event.dart';
import 'package:frequency/bloc/discipline/discipline_state.dart';
import 'package:frequency/bloc/frequency/frequency_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_event.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/widgets/frequency_buttons.dart';
import 'package:frequency/widgets/text_divider.dart';

class PresenceTodayCard extends StatefulWidget {
  const PresenceTodayCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PresenceTodayCardState();
  }
}

class PresenceTodayCardState extends State<PresenceTodayCard> {
  late UserBloc userBloc;
  late DisciplineBloc disciplineBloc;

  @override
  void initState() {
    super.initState();

    userBloc = BlocProvider.of<UserBloc>(context);
    UserState currentState = userBloc.state;

    if (currentState is UserData) {
      UserDataModel userData = currentState.user;

      disciplineBloc = BlocProvider.of<DisciplineBloc>(context);

      disciplineBloc.add(GetTodayFrequencyRequested(userData.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisciplineBloc, DisciplineState>(
      builder: (context, state) {
        var child = notHasFrequency();

        if (state is LoadingDiscipline) {
          child = CircularProgressIndicator();
        }

        if (state is TodaysDiscipline) {
          if (state.todaysFrequencies['id'] != null) {
            child = hasFrequency(state.todaysFrequencies);
          }
        }

        return child;
      },
    );
  }

  Widget hasFrequency(todayFrequency) {
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
              color: Color(0xffeeeeff),
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
          child: TextDivider(text: todayFrequency['description']),
        ),
        const FrequencyButtons(),
      ]),
    );
  }

  Widget notHasFrequency() {
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
              color: Color(0xffeeeeff),
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
          'Você não possui nenhuma aula hoje!',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ]),
    );
  }
}
