import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 10.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfilePhoto(isActive: false, imgUrl: user.imageUrl),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        print("Create Room");
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      )),
      color: Colors.white,
      borderSide: BorderSide(
        color: Colors.blueAccent[100],
        width: 3.0,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 3.0,
          ),
          Text("Create\nRoom")
        ],
      ),
    );
  }
}
