import 'package:equatable/equatable.dart';
import 'package:frequency/model/firebase/course_data.dart';

abstract class CourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddCourseRequested extends CourseEvent {
  final CourseDataModel courseData;
  final String userId;

  AddCourseRequested(this.courseData, this.userId);
}
