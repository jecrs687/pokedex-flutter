import 'package:pokeapi/types/pokemon.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

Future<Pokemon> fetchPokemon(int id) async {
  print(id);
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokemon.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
