import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todolistrefresh/settings_screen/settings_screen.dart';
import 'package:todolistrefresh/tasks_screen/bottom_sheet.dart';
import 'package:todolistrefresh/tasks_screen/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.todolist,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (currentindex) {
            index = currentindex;
            setState(() {});
          },
          currentIndex: index,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {
          showbottomSheet();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksScreen(), SettingsScreen()];

  void showbottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return BottomSheetWidget();
        });
  }
}
