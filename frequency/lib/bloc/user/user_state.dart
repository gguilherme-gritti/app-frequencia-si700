import 'package:equatable/equatable.dart';
import 'package:frequency/model/firebase/user_data.dart';

abstract class UserState extends Equatable {}

class LoadingUser extends UserState {
  final bool load;
  LoadingUser({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends UserState {
  @override
  List<Object> get props => [];
}

class RegisteredUser extends UserState {
  @override
  List<Object> get props => [];
}

class UserData extends UserState {
  final UserDataModel user;

  UserData({required this.user});

  List<Object> get props => [user];

  UserDataModel get getUserData => user;
}

class UserError extends UserState {
  final String msg;

  UserError({required this.msg});

  @override
  List<Object> get props => [msg];
}
