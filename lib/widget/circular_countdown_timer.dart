import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final CountDownController _controller = CountDownController();
  final int _duration = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularCountDownTimer(
          duration: _duration,
          initialDuration: 0,
          controller: _controller,
          width: 100.0,
          height: 100.0,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Color(0xFF437b4d),
          fillGradient: null,
          backgroundColor: Colors.white,
          backgroundGradient: null,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
        ),
      ],
    );
  }
}
