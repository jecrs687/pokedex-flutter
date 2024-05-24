import 'package:flutter/material.dart';
import 'package:pokeapi/apis/getPokemons.dart';
import 'package:pokeapi/src/app/details.dart';
import 'package:pokeapi/src/pokemon/pokemon_box.dart';
import 'package:pokeapi/types/pokemons.dart';

/// Displays detailed information about a SampleItem.
class _PokemonList extends State<PokemonList> {
  late Future<Pokemons> futurePokemons;

  @override
  void initState() {
    super.initState();
    futurePokemons = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemons>(
        future: futurePokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: snapshot.data!.results
                  .map((item) => PokemonBox(
                      name: item.name,
                      url: item.url,
                      id: snapshot.data!.results.indexOf(item) + 1))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              style: TextStyle(color: Colors.black),
            );
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}

class PokemonList extends StatefulWidget {
  @override
  State<PokemonList> createState() => _PokemonList();

  const PokemonList({Key? key}) : super(key: key);
}
