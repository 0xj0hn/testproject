import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrement) {
        emit(state + 1);
      } else {
        emit(state - 1);
      }
    });
    on<CounterIncrement>((event, emit) {
      emit(state + 3);
    });
  }
}
