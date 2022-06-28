import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/core/getStorageCacheHelper/get_storage_cache_helper.dart';
import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/login/login_view.dart';
import 'package:ehsan_project/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          top: -100,
          child: Transform.rotate(
            angle: -30,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: 500,
              color: AppColors.blue6.withOpacity(0.5),
            ),
          ),
        ),
        OnBoard(
          pageController: _pageController,
          onBoardData: onBoardData,
          descriptionStyles: Theme.of(context).textTheme.bodyText1,
          imageWidth: 300,
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: Colors.black38,
            activeColor: AppColors.blue6,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: TextButton(
            onPressed: () async => await done(),
            child: const Text(
              "تخطي",
              style: TextStyle(color: Colors.white),
            ),
          ),
          nextButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              return MainButton(
                text: state.isLastPage ? "تم" : "التالي",
                onPressed: () => _onNextTap(state),
                horizontalPadding: 16.0,
              );
            },
          ),
        )
      ]),
    );
  }

  Future<void> done() async {
    await CacheHelper.cacheOnBoarding(value: true);
    MagicRouter.navigateAndPopAll(const LoginView());
  }

  void _onNextTap(OnBoardState onBoardState) async {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      await done();
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    description: "",
    title: '''قال رسول الله -صلى الله عليه وسلم
    ( خير الناس أنفعهم للناس )''',
    imgUrl: 'assets/images/on_boarding1.png',
  ),
  const OnBoardModel(
    description: "",
    title: "معاً نتطوع ، معاً نبني حضارة أُمة",
    imgUrl: 'assets/images/on_boarding2.png',
  ),
  const OnBoardModel(
    description: '',
    title: "إذا استطعت أن ترسم ابتسامة لا تتأخر",
    imgUrl: "assets/images/on_boarding3.png",
  ),
];
