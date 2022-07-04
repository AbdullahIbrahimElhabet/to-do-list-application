import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todolistrefresh/database(firebase)/firebase_utils.dart';
import 'package:todolistrefresh/model/task.dart';
import 'package:todolistrefresh/ui_utils.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  DateTime selctedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.addnewtask,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                      title = text;
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
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                  TextFormField(
                    maxLines: 4,
                    minLines: 4,
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.description,
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            AppLocalizations.of(context)!.taskdate,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
              onTap: () {
                datePicker();
                setState(() {});
              },
              child: Text(
                "${selctedDate.year} / ${selctedDate.month} / ${selctedDate.day}",
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              onPressed: () {
                addTask();
              },
              child: Text(AppLocalizations.of(context)!.addtask))
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

  void addTask() {
    if (_formKey.currentState!.validate()) {
      Task task = Task(
          title: title,
          description: description,
          date: DateUtils.dateOnly(selctedDate).millisecondsSinceEpoch);
      showDialoge(
          "${AppLocalizations.of(context)!.loading}..............", context);
      addTaskToFirbase(task).then((value) {
        hidDailoge(context);
        showMessage(AppLocalizations.of(context)!.thetaskhasbeensuccadded,
            context, AppLocalizations.of(context)!.ok, () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }).catchError((Object error) {
        showMessage(
            AppLocalizations.of(context)!
                .therewasanerroraddingthetaskpleasetryagain,
            context,
            AppLocalizations.of(context)!.ok, () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      });
    }
  }
}
