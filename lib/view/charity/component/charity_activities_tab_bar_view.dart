import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/charity/controller/charity_cubit.dart';
import 'package:ehsan_project/view/donait/donait_view.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CharityActivitiesTabBarView extends StatelessWidget {
  const CharityActivitiesTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CharityCubit.get(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cubit.charityActivitiesList.length,
      itemBuilder: (context, index) {
        return ListTile(
          dense: false,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          leading: SizedBox(
            child: Container(
              width: 100.0,
              height: 500,
              decoration: BoxDecoration(border: Border.all(color: AppColors.blue6, width: 1.0)),
              child: Image.asset(
                cubit.charityActivitiesList[index]['img'].toString(),
                fit: BoxFit.cover,
                height: 500.0,
              ),
            ),
          ),
          title: Text(
            cubit.charityActivitiesList[index]['name'].toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: ElevatedButton(
              onPressed: () => MagicRouter.navigateTo(const DonaitView()),
              style: ElevatedButton.styleFrom(
                  primary: AppColors.blue6, elevation: 0.0, shape: const RoundedRectangleBorder()),
              child: Text('تبرع', style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white))),
        );
      },
    );
  }
}
