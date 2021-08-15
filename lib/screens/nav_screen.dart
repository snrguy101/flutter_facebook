import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  // final List<int> index = [
  //   0,
  //   1,
  //   2,
  //   3,
  //   4,
  //   5,
  // ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screensize.width, 100),
                  child: CustomAppBar(
                    currentUser: currentUser,
                    icons: _icons,
                    selectedindex: selectedindex,
                    ontap: (index) => setState(() => selectedindex = index),
                  ),
                )
              : null,
          body: IndexedStack(
            children: _screens,
            index: selectedindex,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  color: Colors.white,
                  child: CustomTabBar(
                    icons: _icons,
                    selectedindex: selectedindex,
                    ontap: (index) => setState(() => selectedindex = index),
                  ),
                )
              : null,
        ));
  }
}
