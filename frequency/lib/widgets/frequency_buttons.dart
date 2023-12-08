import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_event.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/frequency_data.dart';

class FrequencyButtons extends StatelessWidget {
  final bool isPressed = false;
  final discipline;

  const FrequencyButtons({required this.discipline});

  @override
  Widget build(BuildContext context) {
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
                        discipline_id: discipline['id'],
                        presence: true),
                    userId));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Falta computada com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {
                      DateTime now = DateTime.now();
                      String formattedDate =
                          "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
                      context.read<FrequencyBloc>().add(AddFrequencyRequested(
                          FrequencyDataModel(
                              date: formattedDate,
                              discipline_id: discipline['id'],
                              presence: false),
                          userId));
                    },
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
                        discipline_id: discipline['id'],
                        presence: true),
                    userId));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Presença computada com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {
                      DateTime now = DateTime.now();
                      String formattedDate =
                          "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
                      context.read<FrequencyBloc>().add(AddFrequencyRequested(
                          FrequencyDataModel(
                              date: formattedDate,
                              discipline_id: discipline['id'],
                              presence: false),
                          userId));
                    },
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
}
