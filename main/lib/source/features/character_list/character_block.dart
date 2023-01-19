import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_events.dart';
import 'character_state.dart';





class ImpEvent {}

class CounterBloc extends Bloc<Event, CharacterState> {
  int _clickCount = 0;

  CounterBloc() : super(ImpState(0)) {
    on<ClickEvent>(onClick);
    on<ResetEvent>(resetCount);
  }

  void onClick(ClickEvent event, Emitter<CharacterState> emitter) {
    _clickCount++;
    emitter(ImpState(_clickCount));
  }

  void resetCount(ResetEvent event, Emitter<CharacterState> emitter) {
    _clickCount = 0;
    emitter(ImpState(_clickCount));
  }
}

