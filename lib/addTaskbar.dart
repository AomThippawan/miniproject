import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:miniproject_note/DisplayTask.dart";
import "package:miniproject_note/button.dart";
import "package:miniproject_note/input_field.dart";
import "package:miniproject_note/navbar.dart";
import "package:get/get.dart";

class AddTaskbarPage extends StatefulWidget {
  const AddTaskbarPage({Key? key}) : super(key: key);

  @override
  State<AddTaskbarPage> createState() => _AddTaskbarPageState();
}

class _AddTaskbarPageState extends State<AddTaskbarPage> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _notecontroller = TextEditingController();

  DateTime _selectDate = DateTime.now();
  String _endTime = '9:30';
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              MyInput(
                title: 'Title',
                hint: 'Enter your title',
                controller: _titlecontroller,
              ),
              MyInput(
                title: 'Note',
                hint: 'Enter your note',
                controller: _notecontroller,
              ),
              MyInput(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectDate),
                widget: IconButton(
                  onPressed: () {
                    _getDatetimeFarmat();
                  },
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInput(
                      title: 'Start Date',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getUsertime(isStartTime: true);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child: MyInput(
                      title: 'End Date',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getUsertime(isStartTime: false);
                        },
                        icon: Icon(Icons.access_time_rounded),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           _validateDate();
              //         },
              //         child: Text('Add Task'))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  // void _validateDate() {
  //   if (_titlecontroller.text.isNotEmpty && _notecontroller.text.isNotEmpty) {
  //     // Navigate to another page to display the entered data
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => DisplayTaskPage(
  //                 title: _titlecontroller.text,
  //                 note: _notecontroller.text,
  //                 selectedDate: _selectDate,
  //                 startTime: _startTime,
  //                 endTime: _endTime,
  //               )),
  //     );
  //   } else {
  //     // Show snackbar if any field is empty
  //     Get.snackbar(
  //       'Required',
  //       "All fields are required!",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.white,
  //       icon: Icon(Icons.warning_amber_rounded),
  //     );
  //   }
  // }

  Future<void> _getDatetimeFarmat() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectDate = pickedDate;
        print(_selectDate);
      });
    }
  }

  Future<void> _getUsertime({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay(hour: 9, minute: 30),
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime.format(context);
        } else {
          _endTime = pickedTime.format(context);
        }
      });
    }
  }
}

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
