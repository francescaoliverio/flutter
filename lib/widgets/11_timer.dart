/*
 * Francesca Oliverio
 * 22/10/2026
*/

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timer",
      debugShowCheckedModeBanner: false,
      home: StartTimerPage(),
    );
  }
}

class StartTimerPage extends StatelessWidget {
  const StartTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Start Timer"), centerTitle: true),
      body: Center(
        child: IconButton.filled(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RunTimerPage()),
            );
          },
          icon: Icon(size: 50, Icons.play_arrow),
        ),
      ),
    );
  }
}

class RunTimerPage extends StatefulWidget {
  const RunTimerPage({super.key});

  @override
  State<RunTimerPage> createState() => _RunTimerPageState();
}

class _RunTimerPageState extends State<RunTimerPage> {
  Timer? _timer;
  int _sec = 0;

  bool _timerIsActive() {
    return (_timer?.isActive ?? false);
  }

  void _pause() {
    _timer?.cancel();
    setState(() {});
  }

  void _resume() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) => setState(() => _sec++),
    );
    setState(() {});
  }

  void _reset() {
    setState(() {
      _sec = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _resume();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(_sec ~/ 60).toString().padLeft(2, '0')}:${(_sec % 60).toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                // Pause / Resume
                IconButton.filled(
                  onPressed: _timerIsActive() ? _pause : _resume,
                  icon: Icon(
                    size: 20,
                    _timerIsActive() ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                // Reset
                IconButton.filled(
                  onPressed: _reset,
                  icon: Icon(size: 20, Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
