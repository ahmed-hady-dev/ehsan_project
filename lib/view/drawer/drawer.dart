import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'component/drawer_body.dart';
import 'widget/drawer_header_body.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.blue6,
        child: ListView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          children: const [
            DrawerHeaderBody(),
            DrawerBody(),
            SizedBox(height: 22.0),
          ],
        ),
      ),
    );
  }
}
