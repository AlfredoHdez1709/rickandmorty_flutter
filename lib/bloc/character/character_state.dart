part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final Character character;
  CharacterLoaded(this.character);

  get props => [character];
}

class CharacterNoLoaded extends CharacterState {}
