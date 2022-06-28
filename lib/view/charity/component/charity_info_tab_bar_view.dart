import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CharityInfoTabBarView extends StatelessWidget {
  const CharityInfoTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
              'مؤسسة صناع الحياة مصر هي مؤسسة أهلية وطنية غير حكومية وغير هادفة للربح ومسجلة مركزياً و تعمل طبقاً لقانون الجمعيات و المؤسسات الأهلية المصرية',
              textAlign: TextAlign.center),
        ),
        const SizedBox(height: 12.0),
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.blue6.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Text('المقرات', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blue6)),
          ),
        ),
        const SizedBox(height: 12.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text('القاهرة: شارع محمد صقر (ش جنينه مول)'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text('المنيا : شارع خمسه أعلي مركز أفاق لطب وجراحة الأسنان'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text('الجيزة : شارع عمر بن الخطاب'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text('بنها : شارع فريد ندا'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text('المحلة الكبرى : المنشية الجديدة أعلي مسجد الحسن والحسين'),
        ),
      ],
    );
  }
}
