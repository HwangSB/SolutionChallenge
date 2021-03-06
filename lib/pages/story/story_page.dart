import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:solution_challenge/generated/l10n.dart';
import 'package:solution_challenge/widgets/animated_wave.dart';
import 'package:infinity_page_view/infinity_page_view.dart';
import 'package:solution_challenge/pages/information_map/information_map_page.dart';
import 'package:solution_challenge/pages/memorial_space/memorial_space_page.dart';
import 'package:solution_challenge/pages/story/story_loading_page.dart';
import 'package:solution_challenge/pages/story/story_my_page.dart';
import 'package:solution_challenge/pages/story/story_write_page.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  PageController _pageController = PageController();
  List<String> _inducedPhrase = [
    S.current.inducedPhrase1,
    S.current.inducedPhrase2,
    S.current.inducedPhrase3,
    S.current.inducedPhrase4,
  ];

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        if (_pageController.hasClients) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              color: Color(0xB3F6FFFE),
              height: 250.0,
              strength: 50,
              speed: 1.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              color: Color(0xE6F3FEFD),
              height: 240.0,
              strength: 50,
              speed: 1.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              color: Color(0xE6C8F0D5),
              height: 210.0,
              strength: 40,
              speed: 0.9,
              offset: 3.14,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              color: Color(0xB380C9F6),
              height: 180.0,
              strength: 60,
              speed: 1.2,
              offset: 1.67,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedWave(
              color: Color(0xB382CCC6),
              height: 180.0,
              strength: 60,
              speed: 1.2,
              offset: 1.0,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/logo_sm.png'),
                            width: 68.0,
                            height: 68.0,
                          ),
                          InkResponse(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoryMyPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF8CDDD5),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                    offset: Offset(0.0, 3.0),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.0,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  '${_inducedPhrase[index % _inducedPhrase.length]}',
                                  style: TextStyle(
                                    fontFamily: 'MapoFlowerIsland',
                                    fontSize: 21,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 0.3
                                      ..color = Color(0xFF707070),
                                  ),
                                ),
                                Text(
                                  '${_inducedPhrase[index % _inducedPhrase.length]}',
                                  style: TextStyle(
                                    fontFamily: 'MapoFlowerIsland',
                                    fontSize: 21,
                                    color: Color(0xFF3B514F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  child: InfinityPageView(
                    controller: InfinityPageController(initialPage: 0),
                    itemCount: 2,
                    itemBuilder: (builder, index) {
                      return StoryStream();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/hand_shake.png',
                      ),
                      height: 48.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationMapPage(),
                        ),
                      );
                    },
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/ribbon.png',
                      ),
                      height: 48.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MemorialSpacePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.edit,
          color: Color(0xFF8CDDD5),
          size: 28.0,
        ),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => StoryWritePage(),
          );

          Navigator.push(context, route);

          route.didPush().then((_) {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Container(
                    width: 300.0,
                    height: 200.0,
                    child: Center(
                      child: Text(
                        S.of(context).storyWriteWarning,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'MapoFlowerIsland',
                          fontSize: 16.0,
                          height: 1.75,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Story extends StatelessWidget {
  final String title;
  final String detail;
  final String color;

  Story({Key key, @required this.title, this.detail = '', this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0.0),
      child: _titleText(this.title),
      onPressed: () {
        Navigator.push(
          context,
          FadePageRoute(
            page: StoryDetailLoadingPage(
                title: this.title,
                detail: this.detail,
                color: Color(int.parse(this.color))),
          ),
        );
      },
    );
  }

  _titleText(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image(
                image: AssetImage('assets/images/left_quote.png'),
              ),
            ),
            SizedBox(
              width: 250.0,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'MapoFlowerIsland',
                  fontSize: 16,
                  color: Color(0xFF3B514F),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: AssetImage('assets/images/right_quote.png'),
              ),
            ),
          ],
        ),
        Divider(
          indent: 64.0,
          endIndent: 64.0,
          color: Color(0xFF707070),
          thickness: 0.6,
          height: 16.0,
        ),
      ],
    );
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

class StoryStream extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('Users')
          .where('hasStory', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Story(title: S.of(context).letterLoadError);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Story(title: S.of(context).letterLoading);
          default:
            List<DocumentSnapshot> documents = snapshot.data.documents;
            if (documents.isNotEmpty) {
              DocumentSnapshot document =
                  documents[random.nextInt(documents.length)];
              return _storyStream(document);
            } else {
              return Story(
                title: S.of(context).checkInternet,
                detail: S.of(context).checkInternetDescription,
              );
            }
        }
      },
    );
  }

  _storyStream(DocumentSnapshot document) {
    return StreamBuilder<QuerySnapshot>(
      stream: document.reference.collection('Stories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Story(title: S.of(context).letterLoadError);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Story(title: S.of(context).letterLoading);
          default:
            List<DocumentSnapshot> documents = snapshot.data.documents;
            DocumentSnapshot document =
                documents[random.nextInt(documents.length)];
            return Story(
              title: document['title'],
              detail: document['detail'],
              color: document['color'],
            );
        }
      },
    );
  }
}
