import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Post {
  String author;
  String body;
  int likes = 0;
  bool userLiked = false;

  Post(this.author, this.body);

  void likePost() {
    userLiked = !userLiked;
    likes += userLiked ? 1 : -1;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TWT App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Post> posts = [];

  void post(String text) {
    setState(() {
      posts.add(Post("Admin", text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello World!")),
      body: Column(children: <Widget>[
        Expanded(child: PostList(posts)),
        TextInputWidget(post),
      ]),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback, {Key? key}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void press() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: press,
          icon: const Icon(Icons.send),
          splashColor: Colors.blueGrey,
          tooltip: "Post message",
        ),
        labelText: "Type a message:",
      ),
    );
  }
}

class PostList extends StatefulWidget {
  final List<Post> posts;
  const PostList(this.posts, {Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        var post = widget.posts[index];
        return Card(
            child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
                    title: Text(post.body), subtitle: Text(post.author))),
            Row(children: <Widget>[
              Container(
                  child: Text(post.likes.toString(),
                      style: const TextStyle(fontSize: 20)),
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0)),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () => like(post.likePost),
                color: post.userLiked ? Colors.red : Colors.grey,
              ),
            ])
          ],
        ));
      },
    );
  }
}
