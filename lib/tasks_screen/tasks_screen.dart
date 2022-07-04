import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistrefresh/database(firebase)/firebase_utils.dart';
import 'package:todolistrefresh/model/task.dart';
import 'package:todolistrefresh/tasks_screen/task_container.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if (date == null) return;
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: Theme.of(context).colorScheme.onSurface,
            dayColor: Theme.of(context).colorScheme.onSurface,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          StreamBuilder<QuerySnapshot<Task>>(
            stream: getTasks(selectedDate),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              List<Task> taskesList = snapshot.data?.docs
                      .map((docSnapShot) => docSnapShot.data())
                      .toList() ??
                  [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskContainer(taskesList[index]);
                  },
                  itemCount: taskesList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
