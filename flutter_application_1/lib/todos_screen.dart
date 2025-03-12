import 'package:flutter/material.dart';
import 'todos.dart';

class TodosScreen extends StatelessWidget {
  final List<Todos> todos; 

  const TodosScreen({super.key, required this.todos}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title), 
            subtitle: Text(todos[index].completed ? 'Completed' : 'Not Completed'), 
          );
        },
      ),
    );
  }
}

