import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants/colors.dart';
import '../models/todo_model.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String todoText;
  final DateTime dateTime;
  bool isDone;
  final Function inserFunction;
  final Function deleteFunction;

  TodoCard(
      {super.key,
      required this.id,
      required this.todoText,
      required this.dateTime,
      required this.isDone,
      required this.inserFunction,
      required this.deleteFunction});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var Todos = ToDo(
      id: widget.id,
      todoText: widget.todoText,
      dateTime: widget.dateTime,
      isDone: widget.isDone,
    );
    return Card(
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.deleteFunction(Todos);
                print('slide Delete');
              },
              backgroundColor: cPink,
              foregroundColor: Colors.white,
              icon: Icons.delete_outline,
              label: 'Delete',
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Checkbox(
                value: widget.isDone,
                onChanged: (bool? value) {
                  setState(() {
                    widget.isDone = value!;
                    print('click ==> Checkbox');
                  });
                  Todos.isDone = value!;
                  widget.inserFunction(Todos);
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.todoText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    widget.dateTime.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: cGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
