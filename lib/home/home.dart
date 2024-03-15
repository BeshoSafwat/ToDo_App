import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/home/add_task_bottom_sheet.dart';
import 'package:todo/home/tabs/settings_tab.dart';
import 'package:todo/home/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffDFECDB),
        appBar: AppBar(
          title: Text(
            "To Do List",
            style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              // عشان يسمح انة ياخد مساحة لفوق علي قد الكيبورد
              isScrollControlled: true,
              // لو دوست في اي حتة يتقفل
              //isDismissible: true,
              context: context,
              builder: (context) {
                return Container(
                    // عشان يسمح انة ياخد مساحة لفوق علي قد الكيبورد
      
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTashBottomSheet());
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white, width: 4)),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.white,
          height: 84,
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedFontSize: 15,
              unselectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                    ),
                    label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: "Settings"),
              ]),
        ),
        body: tabs[index],
      ),
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
