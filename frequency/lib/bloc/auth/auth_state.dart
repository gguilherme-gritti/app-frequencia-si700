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
  final String msg;

  UnAuthenticated({required this.msg});

  @override
  List<Object> get props => [msg];
}

class Authenticated extends AuthState {
  final User user;
  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}
