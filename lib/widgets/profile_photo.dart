import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class ProfilePhoto extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final bool hasborder;
  const ProfilePhoto({
    Key key,
    @required this.isActive,
    @required this.imgUrl,
    this.hasborder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasborder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imgUrl),
          ),
        ),
        isActive == true
            ? Positioned(
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      )),
                ),
                bottom: 0.0,
                right: 0.0,
              )
            : Center()
      ],
    );
  }
}
