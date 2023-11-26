import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final int noteId;

  @HiveField(1)
  final String tittle;

  @HiveField(2)
  final String content;

  Note({required this.noteId, required this.tittle, required this.content});
}
