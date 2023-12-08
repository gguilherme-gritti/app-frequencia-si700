import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/discipline/discipline_event.dart';
import 'package:frequency/bloc/discipline/discipline_state.dart';
import 'package:frequency/data/firestore_repository.dart';

class DisciplineBloc extends Bloc<DisciplineEvent, DisciplineState> {
  final FirestoreRepository dbRepository;

  DisciplineBloc({required this.dbRepository}) : super(UnAuthenticated()) {
    on<AddDisciplineRequested>((event, state) async {
      state(LoadingDiscipline(load: true));
      try {
        await dbRepository.addDiscipline(
            disciplineData: event.disciplineData, userId: event.userId);
        state(RegisteredDiscipline());
        state(LoadingDiscipline(load: false));
      } catch (e) {
        state(LoadingDiscipline(load: false));
        state(DisciplineError(msg: e.toString()));
      }
    });

    on<GetDisciplinesRequested>((event, state) async {
      state(LoadingDiscipline(load: true));
      try {
        var disciplines = await dbRepository.getDisciplines(
            userId: event.userId, courseId: event.courseId);
        state(LoadingDiscipline(load: false));
        state(DisciplinesList(disciplines: disciplines));
      } catch (e) {
        state(LoadingDiscipline(load: false));
        state(DisciplineError(msg: e.toString()));
      }
    });

    on<GetTodayFrequencyRequested>((event, state) async {
      state(LoadingDiscipline(load: true));
      try {
        var todayDisciplines =
            await dbRepository.getTodayDiscipline(userId: event.userId);
        state(LoadingDiscipline(load: false));
        state(TodaysDiscipline(todaysFrequencies: todayDisciplines));
      } catch (e) {
        state(LoadingDiscipline(load: false));
        state(DisciplineError(msg: e.toString()));
      }
    });
  }
}
