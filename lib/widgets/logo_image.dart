import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double? topPadding;
  final double? bottomPadding;
  const LogoImage({
    Key? key,
    this.topPadding = 64.0,
    this.bottomPadding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
      child: Image.asset(
        'assets/images/logo_blue.png',
        fit: BoxFit.contain,
        height: 120.0,
      ),
    );
  }
}
