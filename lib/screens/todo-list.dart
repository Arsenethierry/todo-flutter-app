import 'package:flutter/material.dart';
import 'package:todo/screens/add-todo-page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateAddTodoPage, label: const Text("Add Tod")),
    );
  }

  void navigateAddTodoPage() {
    final route = MaterialPageRoute(
      builder: (context) => const AddTodoPage(),
    );
    Navigator.push(context, route);
  }
}
