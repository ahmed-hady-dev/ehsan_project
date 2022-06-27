import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/view/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';

class RecommendedCharitiesRow extends StatelessWidget {
  const RecommendedCharitiesRow({
    Key? key,
    required this.imageList,
    this.onTap,
  }) : super(key: key);

  final List imageList;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: imageList
            .map((e) => InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.blue6, width: 1.0),
                      image: DecorationImage(image: AssetImage(e), fit: BoxFit.contain),
                    ),
                  ),
                ))
            .toList()
            .reversed
            .toList(),
      ),
    );
  }
}
