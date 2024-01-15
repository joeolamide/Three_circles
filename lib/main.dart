import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timeline Tiles Example'),
        ),
        body: TimelineTilesScreen(),
      ),
    );
  }
}

class TimelineTilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimelineTile(number: 1, onTap: () => _showFullScreenBox(context, 1)),
              DottedLine(
                direction: Axis.horizontal,
                lineLength: 10.0,
                lineThickness: 0.5,
                dashLength: 5.0,
                dashColor: Colors.blue,
              ),
              TimelineTile(number: 2, onTap: () => _showFullScreenBox(context, 2)),
              DottedLine(
                direction: Axis.horizontal,
                lineLength: 10.0,
                lineThickness: 0.5,
                dashLength: 5.0,
                dashColor: Colors.blue,
              ),
              TimelineTile(number: 3, onTap: () => _showFullScreenBox(context, 3)),
            ],
          ),
        ),
        // SizedBox(height: 16),
        // Center(
        //   child: Text(
        //     'Text beneath the Timeline Tiles',
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),
      ],
    );
  }

  void _showFullScreenBox(BuildContext context, int timelineNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Full-Screen Box for Timeline $timelineNumber',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // Add content for the full-screen box as needed
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TimelineTile extends StatelessWidget {
  final int number;
  final VoidCallback onTap;

  TimelineTile({required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('Timeline $number'),
        ],
      ),
    );
  }
}
