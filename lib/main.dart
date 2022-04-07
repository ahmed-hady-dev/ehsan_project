import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/getStorageCacheHelper/get_storage_cache_helper.dart';
import 'firebase_options.dart';
import 'view/home/home_view.dart';
import 'view/login/login_view.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_cubit.dart';

import 'core/blocObserver/bloc_observer.dart';
import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'view/on_boarding/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Widget? home;
  FirebaseAuth.instance.userChanges().listen((user) {
    if (user == null) {
      home = const LoginView();
    } else {
      home = const HomeView();
    }
    home ??= const HomeView();
  });
  //===============================================================
  DioHelper.init();
  //===============================================================
  await EasyLocalization.ensureInitialized();
  //===============================================================
  await CacheHelper.init();
  await CacheHelper.getTheme ?? await CacheHelper.cacheTheme(value: false);
  await CacheHelper.getOnBoarding ?? await CacheHelper.cacheOnBoarding(value: false);
  bool? isDark = await CacheHelper.getTheme;
  bool? isOnBoardingDone = await CacheHelper.getOnBoarding;
  //===============================================================
  BlocOverrides.runZoned(
    () {
      runApp(EasyLocalization(
        child: MyApp(isDark: isDark!, isOnBoardingDone: isOnBoardingDone!, home: home!),
        path: 'assets/translation',
        startLocale: const Locale('ar', 'EG'),
        supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
        fallbackLocale: const Locale('ar', 'EG'),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark, required this.home, required this.isOnBoardingDone}) : super(key: key);
  final bool isDark;
  final bool isOnBoardingDone;
  final Widget home;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()..changeTheme(themeModeFromCache: isDark)),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            var themeCubit = ThemeCubit.get(context).isDark;
            return MaterialApp(
              //TODO: add your application name here
              title: 'Ehsan Charity Platform',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              onGenerateRoute: onGenerateRoute,
              themeMode: themeCubit ? ThemeMode.dark : ThemeMode.light,
              theme: lightTheme(context),
              darkTheme: darkTheme(context),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home: isOnBoardingDone ? const LoginView() : OnBoardingView(),
            );
          },
        ));
  }
}
