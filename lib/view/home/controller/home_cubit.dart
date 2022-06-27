import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
//===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  int carouselIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> slidesModel = [
    'assets/images/home_1.jpg',
    'assets/images/home_2.jpg',
    'assets/images/home_3.jpg',
  ];
  final List<String> recommendedCharities = [
    'assets/images/charity_1.png',
    'assets/images/charity_2.png',
    'assets/images/charity_3.png',
  ];
  final List<String> homeCharities = [
    'assets/images/charity_4.jpg',
    'assets/images/charity_5.png',
    'assets/images/charity_6.jpg',
    'assets/images/charity_7.jpg',
  ];
//===============================================================
  changeCarouselIndex({required int index}) {
    carouselIndex = index;
    emit(ChangeCarouselIndex());
  }
}
