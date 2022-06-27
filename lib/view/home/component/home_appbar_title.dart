import 'package:easy_localization/src/public_ext.dart';
import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBarTitle extends StatelessWidget {
  final VoidCallback onPressed;
  const HomeAppBarTitle({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16.0, start: 4.0),
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.blue6,
            alignment: Alignment.centerRight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 12.0, color: Colors.white),
          label: Text(
            'إبحث',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
