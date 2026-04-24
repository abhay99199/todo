import 'package:hive/hive.dart';

class ToDoDataBase{
  List<List<dynamic>> todoList = [];
//referance box dart
final _mybox = Hive.box('mybox');
// first time ever opening data
void createInitialData(){
todoList =[
  ["Make tutorial",false],
  ["Do Excercise",false],
];
}
//load data from data base
void loadData(){
  final data = _mybox.get("ToDoList");
  if (data != null) {
    todoList = List<List<dynamic>>.from(data);
  }
}
//  update data base
void updateDatabase() {
_mybox.put("ToDoList", todoList);
}
}