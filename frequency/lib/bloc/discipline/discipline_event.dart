import 'package:equatable/equatable.dart';
import 'package:frequency/model/firebase/discipline_data.dart';

abstract class DisciplineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddDisciplineRequested extends DisciplineEvent {
  final DisciplineDataModel disciplineData;
  final String userId;

  AddDisciplineRequested(this.disciplineData, this.userId);
}

class GetDisciplinesRequested extends DisciplineEvent {
  final String userId;
  final String courseId;

  GetDisciplinesRequested(this.userId, this.courseId);
}

class GetTodayFrequencyRequested extends DisciplineEvent {
  final String userId;

  GetTodayFrequencyRequested(this.userId);
}
