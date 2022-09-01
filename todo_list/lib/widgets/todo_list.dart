import 'package:flutter/material.dart';
import 'package:todo_list/models/db_model.dart';
import 'package:todo_list/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  final Function inserFunction;
  final Function deleteFunction;
  final db = DBTodo();
  TodoList({
    super.key,
    required this.inserFunction,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getToDo(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0
              ? Center(
                  child: Text('no todo list'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => TodoCard(
                    id: data[i].id,
                    todoText: data[i].todoText,
                    dateTime: data[i].dateTime,
                    isDone: data[i].isDone,
                    inserFunction: inserFunction,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
