import 'package:flutter/material.dart';

import '../constant/colors.dart';

class TimeProgressBar extends StatefulWidget {
  final Duration duration;

  const TimeProgressBar({Key? key, required this.duration})
      : super(key: key);

  @override
  _TimeBasedProgressWidgetState createState() =>
      _TimeBasedProgressWidgetState();
}

class _TimeBasedProgressWidgetState extends State<TimeProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Duration _elapsedTime;
  late Duration _totalTime;

  @override
  void initState() {
    super.initState();
    _totalTime = widget.duration;
    _elapsedTime = Duration.zero;
    _animationController = AnimationController(
      vsync: this,
      duration: _totalTime,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        _elapsedTime = Duration(
          milliseconds: (_animationController.value * _totalTime.inMilliseconds)
              .floor(),
        );
        return LinearProgressIndicator(
          color: backButton,
          backgroundColor: kNeutralLightColor,
          value: _elapsedTime.inMilliseconds / _totalTime.inMilliseconds,
        );
      },
    );
  }
}
