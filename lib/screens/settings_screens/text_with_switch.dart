import 'package:flutter/material.dart';

class TextWithSwitch extends StatefulWidget {
  @override
  _TextWithSwitchState createState() => _TextWithSwitchState();
}

class _TextWithSwitchState extends State<TextWithSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 114),
          child: Text(
            'Vibro',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: Colors.white),
          ),
        ),
        // Пространство между текстом и переключателем
        Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeTrackColor: Colors.red,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.red,
        ),
      ],
    );
  }
}
