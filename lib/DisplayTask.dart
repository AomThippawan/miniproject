import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayTaskPage extends StatelessWidget {
  final String title;
  final String note;
  final DateTime selectedDate;
  final String startTime;
  final String endTime;

  DisplayTaskPage({
    required this.title,
    required this.note,
    required this.selectedDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Note:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                note,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Date:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMd().format(selectedDate),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Start Time:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                startTime,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'End Time:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                endTime,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
