import 'package:flutter/material.dart';
import 'package:pokeapi/src/DownSideAppBar/DownSideAppBar.dart';
import 'package:pokeapi/src/pokemon/list.dart';
import 'package:pokeapi/src/pokemon/pokemon_box.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class Home extends StatelessWidget {
  const Home({
    super.key,
    this.items = const [
      SampleItem('Bulbasaur', 'assets/images/bulbasaur.png'),
      SampleItem('Charmander', 'assets/images/charmander.png'),
      SampleItem('Squirtle', 'assets/images/squirtle.png'),
      SampleItem('Butterfree', 'assets/images/butterfree.png'),
      SampleItem('Pikachu', 'assets/images/pikachu.png'),
      SampleItem('Jigglypuff', 'assets/images/jigglypuff.png'),
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

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
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(90), child: DownSideAppBar()),
          actions: [
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
          height: Size.infinite.height,
          width: Size.infinite.width,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const SingleChildScrollView(
                child: const PokemonList(),
              )),
        ));
  }
}
