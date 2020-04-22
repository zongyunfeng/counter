import 'dart:math';

import 'package:counter/FancyButton.dart';
import 'package:flutter/material.dart';

class FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: _getColors(),
        child: widget.child,
        onPressed: widget.callback,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('create again');
  }

  Color _getColors() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }
}

Map<FancyButtonState, Color> _buttonColors = {};
final _random = Random();

int next(int min, int max) => min + _random.nextInt(max - min);
List<Color> colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amber,
  Colors.lightBlue,
];
