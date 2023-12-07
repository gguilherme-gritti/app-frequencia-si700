import 'package:equatable/equatable.dart';
import 'package:frequency/model/register_user_data.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddUserRequested extends UserEvent {
  final RegisterUserData userData;

  AddUserRequested(this.userData);
}
