import 'package:flutter/material.dart';
import 'post.dart';

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
