import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/dependencies_config.dart';
import 'src/Rick_and_Morty_app.dart';

void main() {
  autoConfigDependencies(Environment.prod);
  runApp(const RickAndMortyApp());
}
