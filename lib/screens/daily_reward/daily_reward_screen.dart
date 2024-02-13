import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/daily_reward_widgets/reward_button.dart';
import '../../widgets/daily_reward_widgets/reward_message_widget.dart';
import '../../widgets/daily_reward_widgets/reward_text_widget.dart';
import '../../widgets/spot_roulette_widgets/customIcon_button_widget.dart';

class DailyRewardScreen extends StatefulWidget {
  @override
  _DailyRewardScreenState createState() => _DailyRewardScreenState();
}

class _DailyRewardScreenState extends State<DailyRewardScreen> {
  late bool isButtonIcon1 = true; // Переменная для отслеживания текущей иконки
  bool rewardOpened = false;
  bool timerStarted = false;
  late DateTime startTime;
  late Timer? timer;
  String timerText = '';

  void _toggleIcon() {
    setState(() {
      isButtonIcon1 = !isButtonIcon1;
    });
  }

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    timerText = '';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 0), (Timer t) {
      updateTimer();
    });
  }

  void updateTimer() {
    Duration difference = DateTime.now().difference(startTime);
    Duration remainingTime = const Duration(days: 1) - difference;
    if (remainingTime.isNegative) {
      setState(() {
        rewardOpened = true;
        timerText = '';
      });
      timer?.cancel();
      return;
    }
    setState(() {
      int hours = remainingTime.inHours % 24;
      int minutes = remainingTime.inMinutes % 60;
      int seconds = remainingTime.inSeconds % 60;
      timerText =
          ' ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Фоновое изображение
          Image.asset(
            'assets/images/daily_reward/daily_reward.png',
            fit: BoxFit.cover,
          ),
          // Затемнение фона
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Изображение с кнопкой назад
          Positioned(
            top: 24,
            left: 62,
            child: CustomIconButton(
              backgroundColor: const Color.fromRGBO(38, 121, 228, 1),
              borderColor: const Color.fromRGBO(24, 64, 134, 1),
              iconData: Icons.arrow_back,
              iconColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Изображение с дополнительной картинкой
          Positioned(
            left: 150,
            top: 0,
            child: Image.asset(
              'assets/images/daily_reward/Ellipse.png',
              width: 385,
              height: 385,
            ),
          ),
          // Изображение с открытым или закрытым письмом
          Positioned(
            left: rewardOpened ? 231 : 260,
            top: rewardOpened ? 24 : 90,
            width: rewardOpened ? 208 : 152,
            height: rewardOpened ? 328 : 202,
            child: Image.asset(
              rewardOpened
                  ? 'assets/images/tiger_fortune/EnvelopeOpen.png'
                  : 'assets/images/tiger_fortune/envelope.png',
              fit: BoxFit.contain,
            ),
          ),

          // Другие элементы интерфейса
          Positioned(
            right: 56,
            top: 30,
            child: Center(
              child: Stack(
                children: [
                  Text(
                    'Daily\nReward'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 48,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                      letterSpacing: -4,
                      color: Color.fromRGBO(202, 34, 44, 1),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Daily\nReward'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 48,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          letterSpacing: -4,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = const Color.fromRGBO(196, 199, 134, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 65,
            bottom: 180,
            child: SizedBox(
              width: 191,
              height: 76,
              child: Center(
                child: RewardTextWidget(
                  rewardOpened: rewardOpened,
                ),
              ),
            ),
          ),

          Positioned(
            right: 95,
            bottom: 102,
            child: RewardMessage(
              rewardOpened: rewardOpened, // Передайте необходимые параметры
              timerText: timerText, // Передайте необходимые параметры
            ),
          ),

          Positioned(
            right: 95,
            bottom: 38,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (!rewardOpened) {
                    rewardOpened = true;
                    startTime = DateTime.now();
                    timerStarted =
                        true; // Устанавливаем флаг, что таймер запущен
                    startTimer(); // Запускаем таймер
                  }
                });
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      width: 4,
                      color: rewardOpened
                          ? const Color.fromRGBO(128, 128, 128, 1)
                          : const Color.fromRGBO(24, 64, 134, 1),
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color.fromRGBO(
                          181, 181, 181, 1); // Цвет фона при нажатии
                    }
                    return const Color.fromRGBO(
                        38, 121, 228, 1); // Цвет фона в обычном состоянии
                  },
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: Text(
                rewardOpened ? 'Reset timer' : 'Open',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          RewardButton(
            rewardOpened: rewardOpened,
            onPressed: () {
              setState(() {
                if (!rewardOpened) {
                  rewardOpened = true;
                  startTime = DateTime.now();
                  timerStarted = true;
                  startTimer();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
