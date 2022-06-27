import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CharitiesGridView extends StatelessWidget {
  final List imageList;
  final Function()? onTap;

  const CharitiesGridView({Key? key, required this.imageList, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 3 / 2),
        shrinkWrap: true,
        itemCount: 4,
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
