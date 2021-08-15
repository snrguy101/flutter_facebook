import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_photo.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 0.0, vertical: 5.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _postHeader(post: post),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    post.caption.toString(),
                  ),
                  post.imageUrl != null
                      ? const Center()
                      : const SizedBox(
                          height: 6.0,
                        ),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                    ),
                  )
                : Center(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: _Poststats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _postHeader extends StatelessWidget {
  final Post post;
  const _postHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfilePhoto(isActive: false, imgUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} . ",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12.5,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class _Poststats extends StatelessWidget {
  final Post post;
  const _Poststats({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                post.likes.toString(),
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              post.comments.toString() + " Coments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              post.shares.toString() + " Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            _postButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: "Like",
              ontap: () {},
            ),
            _postButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: "Comment",
              ontap: () {},
            ),
            _postButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: "Share",
              ontap: () {},
            )
          ],
        )
      ],
    );
  }
}

class _postButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function ontap;
  const _postButton(
      {Key key,
      @required this.icon,
      @required this.label,
      @required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 4.0,
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
