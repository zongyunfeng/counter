import 'package:counter/FancyButton.dart';
import 'package:flutter/cupertino.dart';

import 'MyHomePage.dart';
import 'package:flutter/material.dart';

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
    _swap();
  }

  void _swap() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final incrementButton = FancyButton(
        key: _buttonKeys.first, child: Text("增加"), callback: _incrementCounter);
    final decrementButton = FancyButton(
        key: _buttonKeys.last, child: Text("减少"), callback: _decrementCounter);
    List<Widget> _buttons = [incrementButton, decrementButton];
    if (_reversed) {
      _buttons = _buttons.reversed.toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.green.withOpacity(0.3)),
              child: Image.asset("qrcode.jpg"),
              margin: EdgeInsets.all(4.0),
              padding: EdgeInsets.only(bottom: 4.0),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buttons),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
