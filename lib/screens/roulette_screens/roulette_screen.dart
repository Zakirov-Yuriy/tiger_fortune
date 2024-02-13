import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:tiger_fortune/screens/roulette_screens/you_win_roulette_screen.dart';

import '../pause/pause_screens.dart';
import 'hamburger_menu_button_widget.dart';
import 'my_roulette.dart';
import 'plus_minus_positioned_widget.dart';
import 'spin_button_widget.dart';

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({Key? key}) : super(key: key);

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen>
    with SingleTickerProviderStateMixin {
  static final _random = Random();

  late RouletteController _controller;
  final bool _clockwise = true;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  final icons = <IconData>[
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.account_balance,
    Icons.account_balance_wallet,
  ];

  final images = <ImageProvider>[
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
    const NetworkImage(
        "https://firebasestorage.googleapis.com/v0/b/zak-db-hotel.appspot.com/o/bgrul.png?alt=media&token=88cd60fc-2878-4035-96f6-c0ad76b5757a"),
  ];

  @override
  void initState() {
    super.initState();

    assert(colors.length == icons.length);
    assert(colors.length == images.length);

    _controller = RouletteController(
      vsync: this,
      group: RouletteGroup.uniformImages(
        colors.length,
        colorBuilder: (index) => colors[index],
        imageBuilder: (index) => images[index],
        textBuilder: (index) {
          if (index == 0) return '100';

          return '';
        },
        styleBuilder: (index) {
          return const TextStyle(color: Color.fromARGB(255, 0, 0, 0));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/spot_roulette/bgRoulette.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyRoulette(controller: _controller),
                ],
              ),
            ),
          ),
          Positioned(
            left: 48,
            top: 30,
            bottom: 28,
            child: Image.asset(
              'assets/images/spot_roulette/Win.png',
              width: 174,
              height: 332,
            ),
          ),
          Positioned(
            right: 40,
            bottom: 70,
            child: Image.asset(
              'assets/images/spot_roulette/Balance.png',
              width: 174,
              height: 332,
            ),
          ),
          PlusMinusPositioned(
            onPlusPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YouWinRouletteScreen()),
              );
            },
            onMinusPressed: () {},
          ),
          HamburgerMenuButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PauseScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: SpinButton(
        onPressed: () => _controller.rollTo(
          3,
          clockwise: _clockwise,
          offset: _random.nextDouble(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
