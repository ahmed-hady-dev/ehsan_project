import 'package:ehsan_project/view/charities/charities_view.dart';
import 'package:ehsan_project/view/charity/charity_view.dart';
import 'package:ehsan_project/view/event/event_view.dart';
import 'package:ehsan_project/view/home/component/home_carousel.dart';
import 'package:ehsan_project/view/home/component/recommended_charities_row.dart';
import 'package:ehsan_project/view/home/controller/home_cubit.dart';
import 'package:ehsan_project/view/home/component/market_banner.dart';
import 'package:ehsan_project/view/market/market_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/router.dart';
import '../drawer/drawer.dart';
import 'component/charities_grid_view.dart';
import 'component/home_appbar.dart';
import 'widgets/section_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            drawer: const NavigationDrawer(),
            appBar: homeAppBar(cubit),
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.top),
              children: [
                HomeCarousel(cubit: cubit, onTap: () => MagicRouter.navigateTo(const EventView())),
                SectionHeader(
                  showButton: false,
                  buttonText: '',
                  headerText: "الجميات المقترحة",
                  onPressed: () {},
                ),
                const SizedBox(height: 8.0),
                RecommendedCharitiesRow(
                  imageList: cubit.recommendedCharities,
                  onTap: () => MagicRouter.navigateTo(const CharityView()),
                ),
                const SizedBox(height: 8.0),
                SectionHeader(
                  buttonText: 'المزيد',
                  headerText: "الجمعيات",
                  onPressed: () => MagicRouter.navigateTo(const CharitiesView()),
                ),
                const SizedBox(height: 8.0),
                CharitiesGridView(
                  imageList: cubit.homeCharities,
                  itemCount: 4,
                  onTap: () => MagicRouter.navigateTo(const CharityView()),
                ),
                SectionHeader(
                  buttonText: 'المزيد',
                  headerText: "سوق الخير",
                  onPressed: () => MagicRouter.navigateTo(const MarketView()),
                ),
                const SizedBox(height: 8.0),
                const MarketBanner(),
              ],
            ),
          );
        },
      ),
    );
  }
}
