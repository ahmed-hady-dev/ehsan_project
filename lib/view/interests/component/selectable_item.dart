import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SelectableItem extends StatefulWidget {
  const SelectableItem({
    Key? key,
    required this.index,
    required this.color,
    required this.selected,
    required this.text,
    required this.img,
  }) : super(key: key);

  final int index;
  final MaterialColor color;
  final bool selected;
  final String text;
  final String img;

  @override
  _SelectableItemState createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: widget.selected ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void didUpdateWidget(SelectableItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      if (widget.selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: DecoratedBox(
            child: child,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.blue6, width: 1.0),
                image: DecorationImage(image: AssetImage(widget.img), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              height: 40.0,
              color: AppColors.blue6,
              child: Text(widget.text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white)),
            ),
          ),
          widget.selected
              ? Positioned(
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  bottom: 0.0,
                  child: Container(
                    color: AppColors.blue6.withOpacity(0.4),
                    child: const Icon(Icons.check, color: Colors.white, size: 42.0),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
