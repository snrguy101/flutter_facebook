import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedindex;
  final Function ontap;
  final bool isbottom;

  const CustomTabBar(
      {Key key,
      @required this.icons,
      @required this.selectedindex,
      this.isbottom = false,
      @required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isbottom == false
              ? Border(
                  top: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )
              : Border(
                  bottom: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )),
      tabs: icons
          .asMap()
          .map((key, value) => MapEntry(
              key,
              Tab(
                icon: Icon(
                  value,
                  color: key == selectedindex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              )))
          .values
          .toList(),
      onTap: ontap,
    );
  }
}
