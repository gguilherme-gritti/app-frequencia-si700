import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_event.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/data/auth_repository.dart';
import 'package:frequency/model/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated(msg: '')) {
    on<SignUpRequested>((event, state) async {
      emit(Loading(load: true));
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Loading(load: false));
      } catch (e) {
        emit(Loading(load: false));
      }
    });

    on<SignInRequested>((event, state) async {
      emit(Loading(load: true));
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        User user = User(id: 'id', email: event.email);
        emit(Authenticated(user: user));
        emit(Loading(load: false));
      } catch (e) {
        emit(UnAuthenticated(msg: e.toString()));
        emit(Loading(load: false));
      }
    });
  }
}
