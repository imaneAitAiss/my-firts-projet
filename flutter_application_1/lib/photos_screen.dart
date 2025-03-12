import 'package:flutter/material.dart';
import 'package:flutter_application_1/photos.dart';


class PhotosScreen extends StatelessWidget {
  final List<Photos> photos;
  const PhotosScreen({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos')),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Photo ID: ${photos[index].id}'),
            subtitle: Text(photos[index].title),
          );
        },
      ),
    );
  }
}
