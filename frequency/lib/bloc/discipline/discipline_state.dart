import 'package:equatable/equatable.dart';

abstract class DisciplineState extends Equatable {}

class LoadingDiscipline extends DisciplineState {
  final bool load;
  LoadingDiscipline({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends DisciplineState {
  @override
  List<Object> get props => [];
}

class RegisteredDiscipline extends DisciplineState {
  @override
  List<Object> get props => [];
}

class DisciplineError extends DisciplineState {
  final String msg;

  DisciplineError({required this.msg});

  @override
  List<Object> get props => [msg];
}

class DisciplinesList extends DisciplineState {
  final disciplines;

  DisciplinesList({required this.disciplines});

  List<Object> get props => [disciplines];
}
