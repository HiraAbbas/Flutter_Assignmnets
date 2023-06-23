import 'package:flutter/material.dart';

class ToggleButtonExample extends StatefulWidget {
  @override
  _ToggleButtonExampleState createState() => _ToggleButtonExampleState();
}

class _ToggleButtonExampleState extends State<ToggleButtonExample> {
  List<bool> _isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Button Example'),
      ),
      body: Center(
        child: ToggleButtons(
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(() {
              _isSelected[index] = !_isSelected[index];
            });
          },
          children: [
            Icon(Icons.check),
            Icon(Icons.close),
          ],
        ),
      ),
    );
  }
}
