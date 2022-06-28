import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/charities/controller/charities_cubit.dart';
import 'package:ehsan_project/view/charity/charity_view.dart';
import 'package:ehsan_project/view/drawer/drawer.dart';
import 'package:ehsan_project/view/home/component/charities_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharitiesView extends StatelessWidget {
  const CharitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharitiesCubit(),
      child: BlocConsumer<CharitiesCubit, CharitiesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CharitiesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              foregroundColor: AppColors.blue6,
              backgroundColor: Colors.transparent,
              actions: const [Directionality(textDirection: TextDirection.ltr, child: BackButton())],
              title: Image.asset('assets/images/logo.png', width: 40.0),
            ),
            drawer: const NavigationDrawer(),
            body: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.blue6,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('الجمعيات',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
                ),
                const SizedBox(height: 16.0),
                CharitiesGridView(
                  childAspectRatio: 1.2,
                  imageList: cubit.charitiesList,
                  itemCount: cubit.charitiesList.length,
                  onTap: () => MagicRouter.navigateTo(const CharityView()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
