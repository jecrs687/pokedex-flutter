import 'package:pokeapi/types/pokemons.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

Future<Pokemons> fetchPokemons() async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=2&offset=20'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokemons.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
