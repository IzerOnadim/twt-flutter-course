import 'package:flutter/material.dart';
import 'text_input.dart';
import 'post.dart';
import 'post_list.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage(this.name, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> posts = [];

  void post(String text) {
    setState(() {
      posts.add(Post(widget.name, text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World!")),
      body: Column(children: <Widget>[
        Expanded(child: PostList(posts)),
        TextInput(post),
      ]),
    );
  }
}
