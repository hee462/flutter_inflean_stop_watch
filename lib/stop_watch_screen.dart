import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StipWatchScreenState();
}

class _StipWatchScreenState extends State<StopWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스톱워치'),
      ),
      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}
