import 'package:equatable/equatable.dart';
import 'package:frequency/model/firebase/discipline_data.dart';
import 'package:frequency/model/firebase/frequency_data.dart';

abstract class FrequencyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFrequencyRequested extends FrequencyEvent {
  final FrequencyDataModel frequencyData;
  final String userId;

  AddFrequencyRequested(this.frequencyData, this.userId);
}

class GetFrequencysRequested extends FrequencyEvent {
  final String userId;
  final String disciplineId;

  GetFrequencysRequested(this.userId, this.disciplineId);
}

class VerifyFrequencyTodayRequested extends FrequencyEvent {
  final String userId;
  final String disciplineId;
  final String date;

  VerifyFrequencyTodayRequested(this.userId, this.disciplineId, this.date);
}
