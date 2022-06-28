import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'charities_state.dart';

class CharitiesCubit extends Cubit<CharitiesState> {
  CharitiesCubit() : super(CharitiesInitial());
  static CharitiesCubit get(context) => BlocProvider.of(context);
//===============================================================
  final List<String> charitiesList = [
    'assets/images/charity_1.png',
    'assets/images/charity_2.png',
    'assets/images/charity_3.png',
    'assets/images/charity_4.jpg',
    'assets/images/charity_5.png',
    'assets/images/charity_6.jpg',
    'assets/images/charity_7.jpg',
    'assets/images/charity_8.jpg'
  ];
}
