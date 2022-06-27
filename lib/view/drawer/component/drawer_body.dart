// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:ehsan_project/view/donait/donait_view.dart';
import 'package:ehsan_project/view/donating_request/donaiting_request_view.dart';
import 'package:ehsan_project/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../../about/about_view.dart';
import '../../home/home_view.dart';
import '../../near_by_charieties/near_by_charieties_view.dart';
import '../widget/drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerItem(
          text: "الصفحة الشخصية".tr(),
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopAll(const ProfileView());
          },
        ),
        DrawerItem(
          text: 'طلبات التبرع',
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const DonaitingRequestView());
          },
        ),
        DrawerItem(
          text: "إستمارة التطوع",
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const DonaitView());
          },
        ),
        DrawerItem(
          text: "الجمعيات القريبة",
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const NearByCharietiesView());
          },
        ),
        DrawerItem(
          text: "عن التطبيق",
          onTap: () {
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const AboutView());
          },
        ),
        DrawerItem(
          text: "تسجيل الخروج",
          onTap: () {
            MagicRouter.pop();
            // MagicRouter.navigateAndPopUntilFirstPage(const AboutView());
          },
        ),
      ],
    );
  }
}
