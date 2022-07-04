import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolistrefresh/database(firebase)/firebase_utils.dart';
import 'package:todolistrefresh/model/task.dart';
import 'package:todolistrefresh/provider/provider.dart';

class EditTaskScreen extends StatefulWidget {
  static const String screenName = "edit";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKeyEdit = GlobalKey<FormState>();
  DateTime selctedDate = DateTime.now();

  //
  // String title = "";
  //
  // String description = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Task;
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height *
                      .25), // here the desired height
              child: AppBar(
                title: Text(AppLocalizations.of(context)!.todolist),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.only(top: 120, right: 30, left: 30, bottom: 80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.themeMode == ThemeMode.light
                  ? Colors.white
                  : Theme.of(context).colorScheme.onBackground,
            ),
            height: double.infinity,
            child: Scaffold(
              backgroundColor: provider.themeMode == ThemeMode.light
                  ? Colors.white
                  : Theme.of(context).colorScheme.onBackground,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.edittask,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Form(
                        key: _formKeyEdit,
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: args.title,
                              onChanged: (text) {
                                args.title = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.title,
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextFormField(
                              initialValue: args.description,
                              maxLines: 4,
                              minLines: 4,
                              onChanged: (text) {
                                args.description = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.description,
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                              ),
                            ),
                          ],
                        )),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.02,
                    // ),
                    // Text(
                    //   "Task Date",
                    //   style: Theme.of(context).textTheme.subtitle1,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.02,
                    // ),
                    // InkWell(
                    //     onTap: () {
                    //       datePicker();
                    //       setState(() {});
                    //     },
                    //     child: Text(
                    //       "${selctedDate.year} / ${selctedDate.month} / ${selctedDate.day}",
                    //       style: Theme.of(context).textTheme.subtitle1,
                    //       textAlign: TextAlign.center,
                    //     )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    ElevatedButton(
                        onPressed: () {
                          editTask(args);
                          Navigator.pop(context);
                        },
                        child:
                            Text(AppLocalizations.of(context)!.savingchanges))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void datePicker() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: selctedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) selctedDate = chosenDate;
    setState(() {});
  }
}

// class TaskArg {
//   String title;
//   String descrption;
//   int date;
//   TaskArg(this.title, this.descrption, this.date);
// }
