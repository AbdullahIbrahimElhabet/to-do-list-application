import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolistrefresh/database(firebase)/firebase_utils.dart';
import 'package:todolistrefresh/model/task.dart';
import 'package:todolistrefresh/provider/provider.dart';
import 'package:todolistrefresh/tasks_screen/edit_task_screen.dart';

class TaskContainer extends StatefulWidget {
  Task task;

  TaskContainer(this.task);

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (buildContext) {
              deleteTaskFromFireStore(widget.task);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, EditTaskScreen.screenName,
              arguments: widget.task);
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: provider.themeMode == ThemeMode.light
                  ? Colors.white
                  : Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    height: 60,
                    width: 4,
                    color: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.task.title,
                            style: widget.task.isDone
                                ? TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)
                                : Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.task.description,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      editIsDone(widget.task);
                      setState(() {});
                    },
                    child: widget.task.isDone
                        ? Text(
                      AppLocalizations.of(context)!.done,
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
