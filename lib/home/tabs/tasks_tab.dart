import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          height: 90,
          locale: "en",
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // setState(() {
            //   _selectedValue = date;
            // });
          },
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12,),
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
