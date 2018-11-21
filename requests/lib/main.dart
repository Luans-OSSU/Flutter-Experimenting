import "dart:async";
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;


Future<Post> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load post");
  }
}


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

}

void main() => runApp(MyApp(post: fetchPost()));


class MyApp extends StatelessWidget {

  final Future<Post> post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fetch Data Example",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data Example"),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: FutureBuilder<Post>(
              future: post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                  child: Text(snapshot.data.title)
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        )
      ),
    );
  }
}

