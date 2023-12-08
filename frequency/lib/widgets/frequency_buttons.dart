import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/frequency/frequency_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_event.dart';
import 'package:frequency/bloc/frequency/frequency_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/frequency_data.dart';
import 'package:frequency/model/firebase/user_data.dart';

class FrequencyButtons extends StatefulWidget {
  final discipline;

  const FrequencyButtons({Key? key, required this.discipline})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FrequencyButtonsState();
  }
}

class FrequencyButtonsState extends State<FrequencyButtons> {
  late UserBloc userBloc;

  late FrequencyBloc frequencyBloc;

  @override
  void initState() {
    super.initState();

    userBloc = BlocProvider.of<UserBloc>(context);
    UserState currentState = userBloc.state;

    if (currentState is UserData) {
      UserDataModel userData = currentState.user;

      frequencyBloc = BlocProvider.of<FrequencyBloc>(context);

      DateTime now = DateTime.now();
      String formattedDate =
          "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";

      frequencyBloc.add(VerifyFrequencyTodayRequested(
          userData.id, widget.discipline['id'], formattedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FrequencyBloc, FrequencyState>(
        builder: (context, state) {
      var child = defaultChild();

      if (state is LoadingFrequency) {
        child = const CircularProgressIndicator();
      } else if (state is HasFrequencyToday) {
        if (state.has == true) {
          child = hasPresence();
        }
      }

      return child;
    });
  }

  Widget defaultChild() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      var userId = "";
      if (userState is UserData) {
        userId = userState.user.id;
      }

      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                String formattedDate =
                    "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
                context.read<FrequencyBloc>().add(AddFrequencyRequested(
                    FrequencyDataModel(
                        date: formattedDate,
                        discipline_id: widget.discipline['id'],
                        presence: true),
                    userId));
                frequencyBloc.add(VerifyFrequencyTodayRequested(
                    userId, widget.discipline['id'], formattedDate));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Falta computada com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {},
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0xFFffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              child: const Text('Falta',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins')),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                String formattedDate =
                    "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
                context.read<FrequencyBloc>().add(AddFrequencyRequested(
                    FrequencyDataModel(
                        date: formattedDate,
                        discipline_id: widget.discipline['id'],
                        presence: true),
                    userId));
                frequencyBloc.add(VerifyFrequencyTodayRequested(
                    userId, widget.discipline['id'], formattedDate));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Presença computada com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {},
                  ),
                ));
              },
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
    });
  }

  Widget hasPresence() {
    return const Text(
      'Você ja marcou presença hoje.',
      style: TextStyle(
          fontSize: 14, fontFamily: 'Poppins', color: Color(0xFF4157ff)),
    );
  }
}
