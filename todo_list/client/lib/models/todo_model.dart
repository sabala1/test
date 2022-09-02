// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToDo {
  int? id;
  final String todoText;
  DateTime dateTime;
  bool isDone;
  ToDo({
    this.id,
    required this.todoText,
    required this.dateTime,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todoText': todoText,
      'dateTime': dateTime.toString(),
      'isDone': isDone ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'ToDo(id: $id, todoText: $todoText, dateTime: $dateTime, isDone: $isDone)';
  }
}
