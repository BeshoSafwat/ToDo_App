
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/task_model.dart';

class AddTashBottomSheet extends StatefulWidget {
  AddTashBottomSheet({super.key});

  @override
  State<AddTashBottomSheet> createState() => _AddTashBottomSheetState();
}

class _AddTashBottomSheetState extends State<AddTashBottomSheet> {
  @override
  DateTime chosenDate = DateTime.now();

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  bool _validate = false;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add New Task",
            style: GoogleFonts.poppins(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                label: const Text("Title"),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12)),
                //
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: const Text("Description"),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12)),
                //
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(height: 26),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Time",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                titleController.text.isEmpty
                    ? _validate = true
                    : _validate = false;

                if (_validate == false) {
                  TaskModel model = TaskModel(
                      title: titleController.text,
                      date:
                          DateUtils.dateOnly(chosenDate).millisecondsSinceEpoch,
                      description: descriptionController.text);
                  FirebaseFunctions.addTask(model);
                  Navigator.pop(context);
                  //
                } else {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
              child: Text(
                "Add Task",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
      //barrierColor: Colors.transparent,
      confirmText: "ok",
      barrierDismissible: true,
    );
    if (selectedDate != null) {
      chosenDate = selectedDate;
      setState(() {});
    }
  }

  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Title Required!',
      message: 'Please enter title!',
      contentType: ContentType.help,
    ),
  );
}
