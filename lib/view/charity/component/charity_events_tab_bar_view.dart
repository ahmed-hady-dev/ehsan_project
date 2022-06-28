import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../event/event_view.dart';
import '../controller/charity_cubit.dart';

class CharityEventsTabBarView extends StatelessWidget {
  const CharityEventsTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CharityCubit.get(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cubit.charityEventsList.length,
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
                cubit.charityEventsList[index]['img'].toString(),
                fit: BoxFit.cover,
                height: 500.0,
              ),
            ),
          ),
          title: Text(
            cubit.charityEventsList[index]['name'].toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: ElevatedButton(
              onPressed: () => MagicRouter.navigateTo(const EventView()),
              style: ElevatedButton.styleFrom(
                  primary: AppColors.blue6, elevation: 0.0, shape: const RoundedRectangleBorder()),
              child: Text('تطوع', style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white))),
        );
      },
    );
  }
}
