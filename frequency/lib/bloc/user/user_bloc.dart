import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/user/user_event.dart';
import 'package:frequency/bloc/user/user_state.dart';
import 'package:frequency/data/firestore_repository.dart';
import 'package:frequency/model/firebase/user_data.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirestoreRepository dbRepository;

  UserBloc({required this.dbRepository}) : super(UnAuthenticated()) {
    on<AddUserRequested>((event, state) async {
      state(Loading(load: true));
      try {
        await dbRepository.addUser(userData: event.userData);
        state(Registered());
        state(Loading(load: false));
      } catch (e) {
        state(Loading(load: false));
        state(UserError(msg: e.toString()));
      }
    });

    on<GetUserRequested>((event, state) async {
      state(Loading(load: true));

      try {
        UserDataModel user = await dbRepository.getUser(email: event.email);
        state(UserData(user: user));
      } catch (e) {
        state(Loading(load: false));
        state(UserError(msg: e.toString()));
      }
    });
  }
}
