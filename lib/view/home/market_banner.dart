import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class MarketBanner extends StatelessWidget {
  const MarketBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 184.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.blue6, width: 1.0),
          image: const DecorationImage(image: AssetImage('assets/images/home_market.jpg'), fit: BoxFit.cover)),
    );
  }
}
