import 'package:ehsan_project/view/charity/component/charity_events_tab_bar_view.dart';
import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/view/charity/component/charity_activities_tab_bar_view.dart';
import 'package:ehsan_project/view/charity/component/charity_info_tab_bar_view.dart';
import 'package:ehsan_project/view/charity/controller/charity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharityView extends StatelessWidget {
  const CharityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharityCubit(),
      child: BlocConsumer<CharityCubit, CharityState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.blue6,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            body: PageView(
              children: <Widget>[
                DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 140.0,
                        width: 172.0,
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.blue6, width: 1.0),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/charity_3.png'), fit: BoxFit.cover)),
                      ),
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: AppColors.blue6, width: 1)),
                        child: TabBar(
                          labelColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: AppColors.blue6,
                          indicatorColor: AppColors.blue6,
                          indicator: BoxDecoration(
                            color: AppColors.blue6,
                            border: Border.all(color: AppColors.blue6),
                          ),
                          tabs: const [
                            Tab(text: 'معلومات'),
                            Tab(text: 'الأنشطه'),
                            Tab(text: 'الإيفنتات'),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(children: <Widget>[
                          CharityInfoTabBarView(),
                          CharityActivitiesTabBarView(),
                          CharityEventsTabBarView(),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
