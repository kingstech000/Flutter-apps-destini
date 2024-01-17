// ignore_for_file: prefer_const_constructors, annotate_overrides, library_private_types_in_public_api

import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain myStory = StoryBrain();

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    myStory.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      myStory.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  child: Text(
                    myStory.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: myStory.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        myStory.nextStory(2);
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: Text(
                      myStory.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
