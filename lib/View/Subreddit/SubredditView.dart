import 'package:flutter/material.dart';
import 'package:reddit_project/Objects/Subreddit.dart';

import 'SubredditCard.dart';

class SubredditView extends StatelessWidget {
  final Subreddit subreddit;

  const SubredditView({Key? key, required this.subreddit}) : super(key: key);

  static const double profileImageSize = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(250, 11, 20, 22),
          appBar: AppBar(
            title: Text("n/${subreddit.title}"),
            backgroundColor: const Color.fromARGB(250, 26, 40, 45),),
          body: ListView.builder(
          itemCount: subreddit.subredditPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return SubredditCard(
              subredditPost: subreddit.subredditPosts[index],
            );
          }),
    ));
  }
}
