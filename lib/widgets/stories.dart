import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_photo.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> story;

  const Stories({Key key, @required this.currentUser, @required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: !Responsive.isDesktop(context) ? Colors.white : null,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: story.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCard(
                isAddstory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story storyy = story[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: StoryCard(
              isAddstory: false,
              story: storyy,
            ),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final bool isAddstory;
  final User currentUser;
  final Story story;
  const StoryCard({Key key, this.isAddstory, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl:
                isAddstory == true ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)
                ? [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddstory == true
              ? Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                      size: 30,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                )
              : ProfilePhoto(
                  isActive: true,
                  imgUrl: story.user.imageUrl,
                  hasborder: true,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddstory ? "Add Story" : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
