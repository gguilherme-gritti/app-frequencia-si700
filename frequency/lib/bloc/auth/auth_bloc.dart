import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/auth/auth_event.dart';
import 'package:frequency/bloc/auth/auth_state.dart';
import 'package:frequency/data/auth_repository.dart';
import 'package:frequency/model/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<SignUpRequested>((event, state) async {
      state(Loading(load: true));
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        state(Registered());
        state(Loading(load: false));
      } catch (e) {
        state(Loading(load: false));
        state(AuthError(msg: e.toString()));
      }
    });

    on<SignInRequested>((event, state) async {
      state(Loading(load: true));
      try {
        bool login = false;
        login = await authRepository.signIn(
            email: event.email, password: event.password);
        User user = User(id: 'id', email: event.email);
        if (login) {
          state(Authenticated(user: user));
        }
        state(Loading(load: false));
      } catch (e) {
        state(UnAuthenticated());
        state(AuthError(msg: e.toString()));
        state(Loading(load: false));
      }
    });
  }
}
