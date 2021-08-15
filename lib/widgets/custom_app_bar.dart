import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_tab_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedindex;
  final User currentUser;
  final Function ontap;

  const CustomAppBar(
      {Key key,
      @required this.icons,
      @required this.selectedindex,
      @required this.currentUser,
      @required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
              icons: icons,
              selectedindex: selectedindex,
              ontap: ontap,
              isbottom: true,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              SizedBox(
                width: 12.0,
              ),
              CircleButton(
                icon: Icons.search,
                func: () {},
                size: 30.0,
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                func: () {},
                size: 30,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
