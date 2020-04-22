import 'package:counter/FancyButtonState.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback callback;

  const FancyButton({Key key, this.child, this.callback}) : super(key: key);

  @override
  FancyButtonState createState() {
    return FancyButtonState();
  }
}
