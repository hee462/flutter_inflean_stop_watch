import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StipWatchScreenState();
}

class _StipWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;

  List<String> _lapTimes = [];

  void _clickButton() {
    // 값을 반대로 바꾸기 true ->false, false ->true
    _isRunning = !_isRunning;
    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, "${_lapTimes.length + 1}등 $time");
  }

  void _pause() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    // timer 있으면 삭제
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/ 100;
    // 2자리 이후로는 0으로 처리해서 움직임 없애기
    String hundredth = "${_time % 100}".padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        title: Text('스톱워치'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$sec',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(hundredth)
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: _lapTimes.map((e) => Center(child: Text(e))).toList(),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _reset();
                },
                backgroundColor: Colors.orange,
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });
                },
                backgroundColor: Colors.blue,
                child: _isRunning
                    ? const Icon(
                        Icons.pause,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _recordLapTime('$sec.$hundredth');
                  });
                },
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
