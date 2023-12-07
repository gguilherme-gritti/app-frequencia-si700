import 'package:equatable/equatable.dart';

abstract class CourseState extends Equatable {}

class LoadingCourse extends CourseState {
  final bool load;
  LoadingCourse({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends CourseState {
  @override
  List<Object> get props => [];
}

class RegisteredCourse extends CourseState {
  @override
  List<Object> get props => [];
}

class CourseError extends CourseState {
  final String msg;

  CourseError({required this.msg});

  @override
  List<Object> get props => [msg];
}
