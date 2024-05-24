import 'package:flutter/material.dart';
import 'package:pokeapi/apis/getPokemon.dart';
import 'package:pokeapi/src/app/details.dart';
import 'package:pokeapi/types/pokemon.dart';

/// Displays detailed information about a SampleItem.
class _PokemonBox extends State<PokemonBox> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PokemonDetails(id: widget.id);
          }));
        },
        child: Container(
            constraints: const BoxConstraints(
              minWidth: 104,
              minHeight: 108,
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
                const BoxShadow(
                  color: Colors.black,
                  spreadRadius: -12.0,
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: FutureBuilder<Pokemon>(
                future: futurePokemon,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          width: 80,
                          child: Text(
                            "#${widget.id}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Image.network(
                          snapshot.data!.sprites?.frontDefault ?? "",
                        ),
                        Text(
                          snapshot.data!.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                })));
    ;
  }
}

class PokemonBox extends StatefulWidget {
  final String name;
  final String url;
  final int id;

  @override
  State<PokemonBox> createState() => _PokemonBox();

  const PokemonBox(
      {Key? key, required this.name, required this.url, required this.id})
      : super(key: key);
}
