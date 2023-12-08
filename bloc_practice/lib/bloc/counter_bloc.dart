import 'package:bloc_practice/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(10) {
    on<CounterIncrement>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecrement>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });
  }
}
