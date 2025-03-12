import 'package:flutter/material.dart';
import 'package:flutter_application_1/users.dart';


class UsersScreen extends StatelessWidget {
  final List<Users> users; 

  const UsersScreen({super.key, required this.users}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name), 
            subtitle: Text(users[index].email), 
          );
        },
      ),
    );
  }
}


