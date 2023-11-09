import 'package:equatable/equatable.dart';
import 'package:frequency/model/user_model.dart';

abstract class AuthState extends Equatable {}

class Loading extends AuthState {
  final bool load;
  Loading({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final User user;
  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class Registered extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String msg;

  AuthError({required this.msg});

  @override
  List<Object> get props => [msg];
}
