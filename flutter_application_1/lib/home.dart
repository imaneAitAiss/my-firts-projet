import 'package:flutter/material.dart';
import 'package:flutter_application_1/post.dart';
import 'package:flutter_application_1/comments.dart';
import 'package:flutter_application_1/albums.dart';
import 'package:flutter_application_1/photos.dart';
import 'package:flutter_application_1/todos.dart';
import 'package:flutter_application_1/users.dart';
import 'api_service.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];
  List<Comments> comments = [];
  List<Albums> albums = [];
  List<Photos> photos = [];
  List<Todos> todos = [];
  List<Users> users = [];
  bool isLoaded = false;
  String? selectedCategory;

  Future<void> fetchData() async {
    try {
      var postsData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/posts');
      var commentsData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/comments');
      var albumsData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/albums');
      var photosData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/photos');
      var todosData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/todos');
      var usersData = await ApiService.fetchData('https://jsonplaceholder.typicode.com/users');

      setState(() {
        posts = postsData.map<Post>((e) => Post.fromJson(e)).toList();
        comments = commentsData.map<Comments>((e) => Comments.fromJson(e)).toList();
        albums = albumsData.map<Albums>((e) => Albums.fromJson(e)).toList();
        photos = photosData.map<Photos>((e) => Photos.fromJson(e)).toList();
        todos = todosData.map<Todos>((e) => Todos.fromJson(e)).toList();
        users = usersData.map<Users>((e) => Users.fromJson(e)).toList();
        isLoaded = true;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: isLoaded
          ? ListView(  
              children: [
                ListTile(
                  title: Text('Posts'),
                  subtitle: Text('Tap to view posts'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'posts';
                    });
                  },
                ),
                ListTile(
                  title: Text('Comments'),
                  subtitle: Text('Tap to view comments'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'comments';
                    });
                  },
                ),
                ListTile(
                  title: Text('Albums'),
                  subtitle: Text('Tap to view albums'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'albums';
                    });
                  },
                ),
                ListTile(
                  title: Text('Photos'),
                  subtitle: Text('Tap to view photos'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'photos';
                    });
                  },
                ),
                ListTile(
                  title: Text('Todos'),
                  subtitle: Text('Tap to view todos'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'todos';
                    });
                  },
                ),
                ListTile(
                  title: Text('Users'),
                  subtitle: Text('Tap to view users'),
                  onTap: () {
                    setState(() {
                      selectedCategory = 'users';
                    });
                  },
                ),
                if (selectedCategory == 'posts')
                  ListView.builder(
                    shrinkWrap: true, //bax listview ykhd misaha limtloba
                    itemCount: posts.length, //kathdad l3anasir liyt3rdo
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].title),
                        subtitle: Text('User ID: ${posts[index].userId}'),
                      );
                    },
                  ),
                if (selectedCategory == 'comments')
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(comments[index].body),
                        subtitle: Text('Post ID: ${comments[index].postId}'),
                      );
                    },
                  ),
                if (selectedCategory == 'albums')
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(albums[index].title),
                        subtitle: Text('User ID: ${albums[index].userId}'),
                      );
                    },
                  ),
                if (selectedCategory == 'photos')
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(photos[index].title),
                        subtitle: Text('Album ID: ${photos[index].albumId}'),
                      );
                    },
                  ),
                if (selectedCategory == 'todos')
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todos[index].title),
                        subtitle: Text('Completed: ${todos[index].completed}'),
                      );
                    },
                  ),
                if (selectedCategory == 'users')
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(users[index].name),
                        subtitle: Text('Email: ${users[index].email}'),
                      );
                    },
                  ),
              ],
            )
          : Center(child: CircularProgressIndicator()), //dik dwayra likador 
    );
  }
}