import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StipWatchScreenState();
}

class _StipWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;
  int time =0;
  bool _isRunning = false;

  List<String> _lapTimes = [];

  @override
  void dispose() {
    // timer 있으면 삭제
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스톱워치'),
      ),
      body: Column(
        children: [
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('0', style: TextStyle(fontSize: 50,),),
              Text('00')
            ],

          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: [
                Center(child: Text('data')),

              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(height: 24,)
        ],
      ),
    );
  }
}
