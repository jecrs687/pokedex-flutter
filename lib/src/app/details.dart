import 'package:flutter/material.dart';
import 'package:pokeapi/src/DownSideAppBar/DownSideAppBar.dart';
import 'package:pokeapi/src/pokemon/details.dart';
import 'package:pokeapi/src/pokemon/pokemon_box.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class PokemonDetails extends StatelessWidget {
  final id;

  const PokemonDetails({
    super.key,
    required this.id,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Pokédex', textAlign: TextAlign.start),
          leading: IconButton(
            icon: Image.asset("assets/images/pokeball.png"),
            onPressed: () {},
          ),
          elevation: 0,
          backgroundColor: Colors.redAccent,
          actions: [
            Container(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      width: 40,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white70,
                          ),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      // Button color
                      child: const Text(
                        '<-',
                        style: TextStyle(color: Colors.black12, fontSize: 10),
                      )),
                )),
            IconButton(
              iconSize: 50,
              icon: ClipOval(
                child: Material(
                  color: Colors.white, // Button color
                  child: InkWell(
                    splashColor: Colors.redAccent, // Splash color
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/qrcode-scan.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.redAccent,
          width: Size.infinite.width,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: PokemonDetailsBody(id: id)),
        ));
  }
}
