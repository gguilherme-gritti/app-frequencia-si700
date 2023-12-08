import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_event.dart';
import 'package:frequency/bloc/frequency/frequency_state.dart';
import 'package:frequency/bloc/user/user_bloc.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/model/firebase/user_data.dart';
import 'package:frequency/widgets/frequency_item_list.dart';

class FrequencyListView extends StatefulWidget {
  const FrequencyListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FrequencyListState();
  }
}

class FrequencyListState extends State<FrequencyListView> {
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

      frequencyBloc.add(GetFrequencysRequested(userData.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [list()],
    );
  }

  Widget list() {
    return BlocBuilder<FrequencyBloc, FrequencyState>(
      builder: (context, state) {
        if (state is FrequencysList) {
          List<Map<String, dynamic>> itemList = state.frequencies;
          return Column(
            children:
                itemList.map((item) => FrequencyItemList(data: item)).toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
