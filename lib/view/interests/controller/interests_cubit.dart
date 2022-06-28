import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'interests_state.dart';

class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit() : super(InterestsInitial());
//===============================================================
  static InterestsCubit get(context) => BlocProvider.of(context);
//===============================================================
  List interestsList = [
    {'name': 'وصلات المياه', 'img': 'assets/images/i1.jpg'},
    {'name': 'كسوة الشتاء', 'img': 'assets/images/i2.jpg'},
    {'name': 'عمليات جراحية', 'img': 'assets/images/i3.PNG'},
    {'name': 'صك الأضحية', 'img': 'assets/images/i4.jpg'},
    {'name': 'سماعات ضعاف السمع', 'img': 'assets/images/i5.jpg'},
    {'name': 'سقف المنازل', 'img': 'assets/images/i6.jpg'},
    {'name': 'سد الديون', 'img': 'assets/images/i7.PNG'},
    {'name': 'إطعام', 'img': 'assets/images/i8.PNG'},
  ];
}
