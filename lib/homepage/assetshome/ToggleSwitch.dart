import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  final VoidCallback switchmode;
  ToggleSwitch({Key? key, required this.switchmode}) : super(key: key);
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _isSwitchedOn = false;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.switchmode();
        setState(() {
          _isSwitchedOn = !_isSwitchedOn;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        width: 70.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _isSwitchedOn ? Colors.green : Colors.red,
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment:
                  _isSwitchedOn ? Alignment.centerRight : Alignment.centerLeft,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                width: 24.0,
                height: 24.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: _isSwitchedOn
                    ? Icon(Icons.spa, color: Colors.green, size: 16.0)
                    : Icon(Icons.music_note, color: Colors.red, size: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
