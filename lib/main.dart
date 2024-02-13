import 'package:flutter/material.dart';

import 'screens/tiger_fortune_screen.dart';

void main() {
  runApp(TigerFortuneApp());
}

class TigerFortuneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiger Fortune',
      home: TigerFortuneScreen(),
    );
  }
}
