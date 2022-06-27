import 'package:flutter/material.dart';

class EmptyAvatar extends StatelessWidget {
  const EmptyAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        radius: 100,
        child: Center(
            child: Icon(
          Icons.person_outline,
          size: 50,
        )),
      ),
    );
  }
}
