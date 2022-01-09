import 'package:flutter/material.dart';

class AnimationSwitch extends StatelessWidget {
  final Widget child;
  const AnimationSwitch({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: child,
    );
  }
}
