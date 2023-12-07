import 'package:equatable/equatable.dart';
import 'package:frequency/model/firebase/user_data.dart';

abstract class UserState extends Equatable {}

class Loading extends UserState {
  final bool load;
  Loading({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends UserState {
  @override
  List<Object> get props => [];
}

class Registered extends UserState {
  @override
  List<Object> get props => [];
}

class UserData extends UserState {
  final UserDataModel user;

  UserData({required this.user});

  List<Object> get props => [user];
}

class UserError extends UserState {
  final String msg;

  UserError({required this.msg});

  @override
  List<Object> get props => [msg];
}