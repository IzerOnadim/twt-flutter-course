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
