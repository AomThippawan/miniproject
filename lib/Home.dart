import "package:date_picker_timeline/date_picker_timeline.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:miniproject_note/addTaskbar.dart";
import "package:miniproject_note/button.dart";
import "package:miniproject_note/navbar.dart";
import 'package:path/path.dart';

DateTime _selectedDate = DateTime.now();

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(),
        body: Column(
          children: [
            _addTaskBar(context),
            // _addDateBar(),
          ],
        ),
      ),
    );
  }
}

_addDateBar() {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
    child: DatePicker(DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color.fromARGB(255, 181, 217, 246),
        selectedTextColor: Colors.black,
        dateTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        onDateChange: (date) {
      _selectedDate = date;
    }),
  );
}

_addTaskBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 25, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Today',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          width: 100,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskbarPage()),
            );
          },
          child: Text('+Add'),
        ),
      ],
    ),
  );
}

//_appbar() {
//   return AppBar(
//     backgroundColor: Colors.white,
//     leading: GestureDetector(
//       onTap: (){
//       },
//       child: Icon,
//     ),
//   );
//  }
