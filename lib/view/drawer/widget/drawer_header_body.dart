import 'package:flutter/material.dart';
import 'empty_avatar.dart';

class DrawerHeaderBody extends StatelessWidget {
  const DrawerHeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              const EmptyAvatar(),
              const SizedBox(height: 8),
              Text('ahmed.hady.dev@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white))
            ],
          ),
        ),
      ],
    );
  }
}
