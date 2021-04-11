import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_bloc/model/character_model.dart';
import 'package:rick_morty_bloc/repository/character_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final characterRepository = CharacterRepository();

  CharacterBloc() : super(CharacterInitial());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is LoadCharacter) {
      yield* _mapLoadCharacter();
    }
  }

  Stream<CharacterState> _mapLoadCharacter() async* {
    yield CharacterInitial();
    try {
      final Character character =
          await characterRepository.getCharcaterRepository().first;
      yield CharacterLoaded(character);
    } catch (e) {
      yield CharacterNoLoaded();
    }
  }
}
