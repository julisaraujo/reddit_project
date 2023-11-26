
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reddit_project/Objects/Subreddit.dart';

class RedditService {

  Future<Subreddit> fetchRedditPosts(String subredditName) async {
    Subreddit subreddit = Subreddit(subredditPosts: [], title: subredditName);
    final response = await http.get(
      Uri.parse('https://www.reddit.com/r/$subredditName/top.json?limit=10'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> posts = data['data']['children'];
      for (var object in posts){
        subreddit.subredditPosts.add(
            SubredditPost(
                title: object['data']['title'],
                description: object['data']['selftext'],
                ups: object['data']['ups'],
                comments: object['data']['num_comments']));
      }
      return subreddit;
    } else {
      throw Exception('Fail do get subreddits');
    }
  }
}