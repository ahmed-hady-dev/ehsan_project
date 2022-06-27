import 'package:flutter/material.dart';
import '../controller/home_cubit.dart';
import '../../../widgets/drawer_icon.dart';

import 'home_appbar_title.dart';

AppBar homeAppBar(HomeCubit cubit) {
  return AppBar(
    centerTitle: false,
    leadingWidth: 40.0,
    titleSpacing: 0.0,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    leading: DrawerIcon(onPressed: () => cubit.scaffoldKey.currentState!.openDrawer()),
    title: HomeAppBarTitle(onPressed: () {}),
  );
}
