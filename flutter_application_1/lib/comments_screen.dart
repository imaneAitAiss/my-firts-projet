import 'package:flutter/material.dart';
import 'package:flutter_application_1/comments.dart';


class CommentsScreen extends StatelessWidget {
  final List<Comments> comments; 

  const CommentsScreen({super.key, required this.comments}); 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(comments[index].name), 
            subtitle: Text(comments[index].body),
          );
        },
      ),
    );
  }
    
  }



   
  
