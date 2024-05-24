import 'package:flutter/material.dart';
import 'package:pokeapi/apis/getPokemon.dart';
import 'package:pokeapi/src/app/details.dart';
import 'package:pokeapi/types/pokemon.dart';

/// Displays detailed information about a SampleItem.
class _PokemonDetailsBody extends State<PokemonDetailsBody> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          if (snapshot.hasData) {
            final pokemon = snapshot.data!;
            return Container(
              color: Colors.green,
              child: Column(children: [
                Row(
                  children: [
                    Text(pokemon.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("#${pokemon.id}"),
                  ],
                ),
                Image.network(pokemon.sprites?.frontDefault ?? ''),
              ]),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}

class PokemonDetailsBody extends StatefulWidget {
  final int id;

  @override
  State<PokemonDetailsBody> createState() => _PokemonDetailsBody();

  const PokemonDetailsBody({Key? key, required this.id}) : super(key: key);
}
