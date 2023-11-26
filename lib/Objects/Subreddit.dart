
class SubredditPost {
  final String title;
  final String description;
  final int ups;
  final int comments;

  SubredditPost({required this.title, required this.description, required this.ups, required this.comments});
}

class Subreddit {
  final String title;
  final List<SubredditPost> subredditPosts;

  Subreddit({required this.subredditPosts, required this.title});
}
