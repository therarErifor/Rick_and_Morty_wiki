import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'features/character_list/character_page_display.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty Wiki',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: CharacterPage());
  }
}