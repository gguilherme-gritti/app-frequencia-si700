import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/course/course_event.dart';
import 'package:frequency/bloc/course/course_state.dart';
import 'package:frequency/data/firestore_repository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final FirestoreRepository dbRepository;

  CourseBloc({required this.dbRepository}) : super(UnAuthenticated()) {
    on<AddCourseRequested>((event, state) async {
      state(LoadingCourse(load: true));
      try {
        await dbRepository.addCourse(
            courseData: event.courseData, userId: event.userId);
        state(RegisteredCourse());
        state(LoadingCourse(load: false));
      } catch (e) {
        state(LoadingCourse(load: false));
        state(CourseError(msg: e.toString()));
      }
    });

    on<GetCoursesRequested>((event, state) async {
      state(LoadingCourse(load: true));
      try {
        var courses = await dbRepository.getCourses(userId: event.userId);
        state(LoadingCourse(load: false));
        state(CoursesList(courses: courses));
      } catch (e) {
        state(LoadingCourse(load: false));
        state(CourseError(msg: e.toString()));
      }
    });
  }
}
