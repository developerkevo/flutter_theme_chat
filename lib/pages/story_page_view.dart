import 'package:flutter/material.dart';
import 'package:flutter_theme_chat/models/story_model.dart';

class StoryPageView extends StatefulWidget {
  final Story story;
  StoryPageView(this.story);
  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5), lowerBound: 0.0, upperBound: 1.0);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
      if (animationController.isCompleted && Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
      ;
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                widget.story.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 2,
                    child: LinearProgressIndicator(value: animationController.value),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget.story.image),
                    ),
                    title: Text(widget.story.name),
                    subtitle: Text("18h"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
