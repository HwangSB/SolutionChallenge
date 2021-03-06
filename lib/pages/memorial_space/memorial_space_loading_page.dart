import 'dart:async';

import 'package:flutter/Material.dart';
import 'package:solution_challenge/generated/l10n.dart';

class MemorialSpaceLoadingPage extends StatefulWidget {
  @override
  _MemorialSpaceLoadingPageState createState() =>
      _MemorialSpaceLoadingPageState();
}

class _MemorialSpaceLoadingPageState extends State<MemorialSpaceLoadingPage> {
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFCDEED8),
              Color(0xFF78D0C8),
              Color(0xFF57A7C4),
              Color(0xFF6E84B4),
              Color(0xFF6768B2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).storyFloated,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'MapoFlowerIsland',
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                    color: Color(0xFFE2E2E2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              S.of(context).storyWriteWarning,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 14,
                fontFamily: 'MapoFlowerIsland',
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                    color: Color(0xFFE2E2E2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _startTimer() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, () {
      Navigator.pop(context);
    });
  }
}
