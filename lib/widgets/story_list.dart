import 'package:flutter/material.dart';
import 'package:flutter_theme_chat/models/story_model.dart';
import 'package:flutter_theme_chat/pages/story_page_view.dart';

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildAddStoryButton(context);
          }
          return buildStoryItem(stories[index], context);
        },
      ),
    );
  }

  Widget buildStoryItem(Story story, context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 54,
            margin: EdgeInsets.only(bottom: 4),
            width: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Theme.of(context).accentColor),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryPageView(story)));
              },
              customBorder: CircleBorder(),
              child: CircleAvatar(
                backgroundImage: NetworkImage(story.image),
              ),
            ),
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Widget buildAddStoryButton(context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Container(
            height: 54,
            width: 54,
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //border: Border.all(width: 2.0, color: Theme.of(context).accentColor),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Text("Add a story"),
        ],
      ),
    );
  }
}
