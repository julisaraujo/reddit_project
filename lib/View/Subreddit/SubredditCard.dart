import 'package:flutter/material.dart';

import '../../Objects/Subreddit.dart';

class SubredditCard extends StatelessWidget {
  final SubredditPost subredditPost;
  const SubredditCard({Key? key, required this.subredditPost}) : super(key: key);

  static const double indent = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(250, 11, 20, 22),
      child: Column(
        children: [
          Column(
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10
                ),
                child: Text(
                  subredditPost.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
              subredditPost.description != "" ? Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  subredditPost.description,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              ) : Container (),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubredditVoteButton(votes: subredditPost.ups),
                    SubredditButtons(
                      text: "${subredditPost.comments}",
                      icon: Icons.mode_comment_outlined,
                    ),
                    const SubredditButtons(
                      text: "Compartilhar",
                      icon: Icons.ios_share_outlined,
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Color.fromARGB(250, 36, 44, 46),
            height: 0,
            thickness: 0.9,
            indent: indent,
            endIndent: indent,
          )
        ],
      ),
    );
  }
}

class SubredditButtons extends StatelessWidget {
  const SubredditButtons({Key? key, required this.icon, required this.text}) : super(key: key);

  final IconData icon;
  final String text;

  static const double buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(250, 11, 20, 22),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonHeight / 2)),
              side: const BorderSide(color: Color.fromARGB(250, 68, 75, 76), width: 0.9)),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 5,
              ),
              Text(text)
            ],
          )),
    );
  }
}

class SubredditVoteButton extends StatelessWidget {
  const SubredditVoteButton({Key? key, required this.votes}) : super(key: key);

  final int votes;

  static const double buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(250, 11, 20, 22),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonHeight / 2)),
              side: const BorderSide(color: Color.fromARGB(250, 68, 75, 76), width: 0.9)),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_upward,
                color: Color.fromARGB(250, 68, 75, 76),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text("$votes"),
              ),
              const Icon(Icons.arrow_downward, color: Color.fromARGB(250, 68, 75, 76))
            ],
          )),
    );
  }
}
