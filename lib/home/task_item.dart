import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Slidable(
          startActionPane:
              ActionPane(motion: DrawerMotion(), extentRatio: .5, children: [
            SlidableAction(
              onPressed: (context) {
                //
              },
              spacing: 12,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: "Delete",
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                //
              },
              spacing: 12,
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              label: "Edite",
            )
          ]),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task Title",
                      style: GoogleFonts.poppins(fontSize: 25),
                    ),
                    Text(
                      "Task Description",
                      style: GoogleFonts.poppins(fontSize: 25),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 25,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
