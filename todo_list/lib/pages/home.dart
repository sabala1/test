import 'package:flutter/material.dart';
import 'package:todo_list/models/db_model.dart';
import 'package:todo_list/widgets/todo_list.dart';

import '../constants/colors.dart';
import '../models/todo_model.dart';
import '../widgets/input_list.dart';

class Home extends StatefulWidget {

  TextEditingController textController = TextEditingController();

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var db = DBTodo();

  void addItem(ToDo todo) async{
    await db.insertTodo(todo);
    setState(() {
      
    });
  }

  void deleteItem(ToDo todo) async{
      await db.deleteTodo(todo);
      setState(() {
        
      });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          TodoList(inserFunction: addItem, deleteFunction: deleteItem,),
          InPutList(inserFunction: addItem,),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bgGrey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ToDo List',
            style: TextStyle(color: cBlue),
          )
        ],
      ),
    );
  }
}
