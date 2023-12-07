import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/course/course_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/course/course_state.dart';
import 'package:frequency/bloc/discipline/discipline_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_event.dart';
import 'package:frequency/bloc/discipline/discipline_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/widgets/list_item.dart';

class CoursesListView extends StatefulWidget {
  const CoursesListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CoursesListState();
  }
}

class CoursesListState extends State<CoursesListView> {
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
    return ListView(
      children: [list()],
    );
  }

  Widget list() {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CoursesList) {
          List<Map<String, dynamic>> itemList = state.courses;
          print(itemList[0]);
          return Column(
            children: itemList.map((item) => ListItem(data: item)).toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
