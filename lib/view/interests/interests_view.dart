import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/home/home_view.dart';
import 'package:ehsan_project/view/interests/controller/interests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/selectable_item.dart';

class InterestsView extends StatefulWidget {
  const InterestsView({Key? key}) : super(key: key);

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
  final controller = DragSelectGridViewController();
  void scheduleRebuild() => setState(() {});

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterestsCubit(),
      child: BlocConsumer<InterestsCubit, InterestsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = InterestsCubit.get(context);
          return Scaffold(
              body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('فيم تفضل المساعدة ؟', style: Theme.of(context).textTheme.headlineSmall),
                    ElevatedButton(
                      onPressed: () => MagicRouter.navigateAndPopAll(const HomeView()),
                      child: const Text('تم'),
                      style: ElevatedButton.styleFrom(primary: AppColors.blue6, elevation: 0.0),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              DragSelectGridView(
                triggerSelectionOnTap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0, childAspectRatio: 1),
                shrinkWrap: true,
                itemCount: cubit.interestsList.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index, selected) {
                  return SelectableItem(
                    index: index,
                    color: Colors.red,
                    selected: selected,
                    img: cubit.interestsList[index]['img'].toString(),
                    text: cubit.interestsList[index]['name'],
                  );
                },
              ),
            ],
          ));
        },
      ),
    );
  }
}
