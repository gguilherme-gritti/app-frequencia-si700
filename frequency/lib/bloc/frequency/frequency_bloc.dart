import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frequency/bloc/frequency/frequency_event.dart';
import 'package:frequency/bloc/frequency/frequency_state.dart';
import 'package:frequency/data/firestore_repository.dart';

class FrequencyBloc extends Bloc<FrequencyEvent, FrequencyState> {
  final FirestoreRepository dbRepository;

  FrequencyBloc({required this.dbRepository}) : super(UnAuthenticated()) {
    on<AddFrequencyRequested>((event, state) async {
      state(LoadingFrequency(load: true));
      try {
        await dbRepository.addFrequency(
            frequencyData: event.frequencyData, userId: event.userId);
        state(RegisteredFrequency());
        state(LoadingFrequency(load: false));
      } catch (e) {
        state(LoadingFrequency(load: false));
        state(FrequencyError(msg: e.toString()));
      }
    });

    on<VerifyFrequencyTodayRequested>((event, state) async {
      state(LoadingFrequency(load: true));
      try {
        bool has = await dbRepository.getTodayPresence(
            discipline_id: event.disciplineId,
            userId: event.userId,
            date: event.date);
        state(LoadingFrequency(load: false));
        state(HasFrequencyToday(has: has));
      } catch (e) {
        state(LoadingFrequency(load: false));
        state(FrequencyError(msg: e.toString()));
      }
    });

    // on<GetFrequencysRequested>((event, state) async {
    //   state(LoadingFrequency(load: true));
    //   try {
    //     var disciplines = await dbRepository.getFrequencys(
    //         userId: event.userId, frequencyId: event.frequencyId);
    //     state(LoadingFrequency(load: false));
    //     state(FrequencysList(disciplines: disciplines));
    //   } catch (e) {
    //     state(LoadingFrequency(load: false));
    //     state(FrequencyError(msg: e.toString()));
    //   }
    // });
  }
}
