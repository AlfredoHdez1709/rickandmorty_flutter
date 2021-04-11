import 'package:rick_morty_bloc/model/character_model.dart';
import 'package:rick_morty_bloc/provider/character_provider.dart';

class CharacterRepository {
  final characterProvider = CharacterProvider();

  Stream<Character> getCharcaterRepository() =>
      characterProvider.getCharacter();
}
