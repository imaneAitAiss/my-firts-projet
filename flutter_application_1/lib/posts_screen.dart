import 'package:flutter/material.dart';
import 'package:flutter_application_1/post.dart';


class PostsScreen extends StatelessWidget {
  final List<Post> posts; 

  const PostsScreen({super.key, required this.posts}); 

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title), 
            subtitle: Text(posts[index].body),
          );
        },
      ),
    );
  }
}
 
    
  
