import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:rick_morty_bloc/model/character_model.dart';

class CharacterProvider {
  Stream<Character> getCharacter() async* {
    var character = Character();
    var url = Uri.https('rickandmortyapi.com', '/api/character');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      character = Character.fromJson(jsonResponse);
    }

    yield character;
  }
}
