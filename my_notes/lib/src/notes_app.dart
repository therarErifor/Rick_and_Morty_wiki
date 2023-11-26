import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/src/routes/router.dart';

class NotesApp extends StatefulWidget{
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() =>
      _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primarySwatch: Colors.green,

      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
          navigatorObservers: () => [
          ]
      ),
    );
  }
}