import 'package:flutter/material.dart';
import 'package:flutter_application_1/albums.dart';


class AlbumsScreen extends StatelessWidget {
  final List<Albums> albums; 

  const AlbumsScreen({super.key, required this.albums}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albums')),
      body: albums.isNotEmpty
    ? ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(albums[index].title), 
            subtitle: Text('User ID: ${albums[index].userId}'), 
          );
        },
      )
    : Center(child: CircularProgressIndicator()),

    );
  }
}

