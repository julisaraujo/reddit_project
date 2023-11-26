import 'package:flutter/material.dart';
import 'package:reddit_project/Service/RedditService.dart';
import 'package:reddit_project/View/Subreddit/SubredditView.dart';

import '../../Objects/Subreddit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static const double searchBoxHeight = 50;
  RedditService redditService = RedditService();
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool textEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(250, 11, 20, 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Image(
                    image: AssetImage('assets/reddit_logo.png'),
                    width: 300,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    height: searchBoxHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(250, 26, 40, 45),
                                borderRadius: BorderRadius.circular(searchBoxHeight / 2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: TextField(
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value){
                                      setState(() {
                                        if (value.isNotEmpty) {
                                          textEmpty = true;
                                        } else {
                                          textEmpty = false;
                                        }
                                      });
                                    },
                                  ),),
                                  textEmpty ? IconButton(
                                      onPressed: (){
                                        textEditingController.clear();
                                        focusNode.unfocus();
                                        textEmpty = false;
                                      },
                                      icon: const Icon(Icons.close, color: Colors.white,)) : Container()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 50,
                width: 150,
                child: OutlinedButton(
                    onPressed: () async {
                      if (textEmpty) {
                        try {
                          Subreddit subreddit = await redditService.fetchRedditPosts(textEditingController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubredditView(subreddit: subreddit)),
                          );
                          textEditingController.clear();
                          focusNode.unfocus();
                          textEmpty = false;
                        } catch (e) {
                          print('Erro: $e');
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: textEmpty ? Color.fromARGB(250, 217, 58, 0) : Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                    child: const Text("Ir para Subreddit")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

