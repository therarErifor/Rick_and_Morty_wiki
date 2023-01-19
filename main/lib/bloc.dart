import 'main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class Event {}

class ClickEvent extends Event {}

class ResetEvent extends Event {}

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
// class ResetBlock extends Block<Event, State>{
//
// }

abstract class CharacterState {}

class ImpState extends CharacterState {
  ImpState(this.clickCount);

  final int clickCount;
}