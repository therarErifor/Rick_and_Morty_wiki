abstract class CharacterState {}

class ImpState extends CharacterState {
  ImpState(this.clickCount);

  final int clickCount;
}