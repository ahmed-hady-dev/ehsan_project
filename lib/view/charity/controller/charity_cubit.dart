import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(CharityInitial());
//===============================================================
  static CharityCubit get(context) => BlocProvider.of(context);
//===============================================================
  List<Map<String, String>> charityActivitiesList = [
    {'img': 'assets/images/1.jpg', 'name': 'سقياً ماء'},
    {'img': 'assets/images/2.jpg', 'name': 'تسقيف البيوت'},
    {'img': 'assets/images/3.jpg', 'name': 'إطعام شهري'},
    {'img': 'assets/images/4.jpg', 'name': 'ستر و دفا'},
    {'img': 'assets/images/5.jpg', 'name': 'سماعات لضعاف السمع'},
    {'img': 'assets/images/6.jpg', 'name': 'صدقه جاريه لمتوفي'},
    {'img': 'assets/images/7.jpg', 'name': 'سد الدين'},
  ];
  List<Map<String, String>> charityEventsList = [
    {'img': 'assets/images/e1.jpg', 'name': 'ألف الخيرية'},
    {'img': 'assets/images/e2.png', 'name': 'دايماً معاك'},
    {'img': 'assets/images/e3.jpg', 'name': 'دفء الشتاء'},
    {'img': 'assets/images/e4.jpg', 'name': 'سقياً الماء'},
  ];
}
