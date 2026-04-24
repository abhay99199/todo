import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/data_base.dart';
import 'package:todoapp/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference to box
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // If this is the first time ever opening the app, then create default data
    if(_mybox.get("ToDoList")==null){
      db.createInitialData();
    }else{
      //there already existing data
      db.loadData();
    }

    super.initState();
  }
  // text controller
  final controller = TextEditingController();
  //List of todo Task

  void checkBoxChanged(bool? value,int index){
setState(() {
  db.todoList[index][1] = !db.todoList[index][1];
});
db.updateDatabase();

  }
  //save new task
  void onSave(){
    setState(() {
      db.todoList.add([controller.text,false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //createNewTask

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: controller,
        onSave: onSave,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    },);
  }
// deleate task
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context,index){
          return TodoTile(taskName: db.todoList[index][0],
            taskCompleted:db.todoList[index][1],
            onChanged: (value)=> checkBoxChanged(value,index),deleteTask: (context)=> deleteTask(index), );
        },

      ),
    );
  }
}
