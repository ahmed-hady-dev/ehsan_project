import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CharitiesGridView extends StatelessWidget {
  final List imageList;
  final Function()? onTap;
  final int? itemCount;
  final double? childAspectRatio;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  const CharitiesGridView({
    Key? key,
    required this.imageList,
    this.onTap,
    this.itemCount,
    this.childAspectRatio = 1.0,
    this.mainAxisSpacing = 16.0,
    this.crossAxisSpacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          crossAxisSpacing: crossAxisSpacing!,
          mainAxisSpacing: mainAxisSpacing!,
          childAspectRatio: childAspectRatio!,
        ),
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.blue6, width: 1.0),
                  image: DecorationImage(image: AssetImage(imageList[index]), fit: BoxFit.contain)),
            ),
          );
        });
  }
}
