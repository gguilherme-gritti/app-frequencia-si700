import 'package:equatable/equatable.dart';

abstract class FrequencyState extends Equatable {}

class LoadingFrequency extends FrequencyState {
  final bool load;
  LoadingFrequency({required this.load});
  @override
  List<Object> get props => [load];
}

class UnAuthenticated extends FrequencyState {
  @override
  List<Object> get props => [];
}

class RegisteredFrequency extends FrequencyState {
  @override
  List<Object> get props => [];
}

class FrequencyError extends FrequencyState {
  final String msg;

  FrequencyError({required this.msg});

  @override
  List<Object> get props => [msg];
}

class FrequencysList extends FrequencyState {
  final frequencies;

  FrequencysList({required this.frequencies});

  List<Object> get props => [frequencies];
}
