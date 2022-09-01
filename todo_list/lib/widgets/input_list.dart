import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/models/todo_model.dart';

class InPutList extends StatelessWidget {
  final Function inserFunction;

  final textController = TextEditingController();

  InPutList({super.key, required this.inserFunction});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: 'Add a new todo item', border: InputBorder.none),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: ElevatedButton(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              onPressed: () {
                var myTodo = ToDo(todoText: textController.text,
                dateTime: DateTime.now(),
                isDone: false
                );
                inserFunction(myTodo);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cBlue,
                minimumSize: Size(40, 40),
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
