import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const DrawerItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30),
        ),
      ),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
