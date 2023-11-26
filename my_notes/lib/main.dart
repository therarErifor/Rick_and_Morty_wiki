import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes/src/notes_app.dart';

void main() async{
  await Hive.initFlutter();
  runApp(const NotesApp());
}