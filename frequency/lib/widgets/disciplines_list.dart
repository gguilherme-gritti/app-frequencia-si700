import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/course/course_state.dart';
import 'package:frequency/bloc/discipline/discipline_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_event.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/widgets/list_item.dart';

class DisciplinesList extends StatefulWidget {
  const DisciplinesList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterDisciplineState();
  }
}

class RegisterDisciplineState extends State<DisciplinesList> {
  late UserBloc userBloc;

  late CourseBloc courseBloc;
  @override
  void initState() {
    super.initState();

    userBloc = BlocProvider.of<UserBloc>(context);
    UserState currentState = userBloc.state;

    if (currentState is UserData) {
      UserDataModel userData = currentState.user;

      courseBloc = BlocProvider.of<CourseBloc>(context);

      courseBloc.add(GetCoursesRequested(userData.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (contextUser, stateUser) {
      var userId = "";
      if (stateUser is UserData) {
        userId = stateUser.user.id;
      }
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CourseDropdown(
              onCourseSelected: (Map<String, dynamic>? selectedCourse) {
                if (selectedCourse != null) {
                  context.read<DisciplineBloc>().add(
                      GetDisciplinesRequested(userId, selectedCourse['id']));
                } else {
                  print("Nenhum curso selecionado");
                }
              },
            ),
          ),
          ListItem(data: {
            'id': '2',
            'code': 'SI701B',
            'week_day': 'Terça',
            'initial_hour': '10:00',
            'final_hour': '12:00',
            'description': 'Redes de Computadores',
          }),
          ListItem(data: {
            'id': '3',
            'code': 'SI702C',
            'week_day': 'Quarta',
            'initial_hour': '14:00',
            'final_hour': '16:00',
            'description': 'Banco de Dados',
          }),
          ListItem(data: {
            'id': '4',
            'code': 'SI703D',
            'week_day': 'Quinta',
            'initial_hour': '16:00',
            'final_hour': '18:00',
            'description': 'Inteligência Artificial',
          }),
        ],
      );
    });
  }
}

class CourseDropdown extends StatefulWidget {
  final Function(Map<String, dynamic>?) onCourseSelected;

  const CourseDropdown({Key? key, required this.onCourseSelected})
      : super(key: key);

  @override
  _CourseDropdownState createState() => _CourseDropdownState();
}

class _CourseDropdownState extends State<CourseDropdown> {
  List<Map<String, dynamic>> items = [
    {'id': '', 'code': ''},
  ];

  Map<String, dynamic>? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(builder: (context, state) {
      if (state is CoursesList) {
        items = state.courses;
      }

      return Column(
        children: [
          Container(
            width: double.infinity, // Define a largura como 100%
            child: DropdownButton<Map<String, dynamic>>(
              value: selectedOption,
              items: items.map((item) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: item,
                  child: Text(item['code']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                  widget.onCourseSelected(selectedOption);
                });
              },
            ),
          ),
        ],
      );
    });
  }
}
