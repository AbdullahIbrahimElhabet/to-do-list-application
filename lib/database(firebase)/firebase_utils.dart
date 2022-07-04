import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistrefresh/model/task.dart';

CollectionReference<Task> getCollectionTask() {
  CollectionReference<Task> getTaskes = FirebaseFirestore.instance
      .collection("task")
      .withConverter<Task>(
          fromFirestore: (snapShote, option) =>
              Task.fromJson(snapShote.data()!),
          toFirestore: (task, option) => task.toJson());
  return getTaskes;
}

Future<void> addTaskToFirbase(Task task) {
  var collection = getCollectionTask();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

void editTask(Task task) {
  getCollectionTask().doc(task.id).update({
    "title": task.title,
    "description": task.description,
  });
}

void editIsDone(Task task) {
  getCollectionTask()
      .doc(task.id)
      .update({"isDone": task.isDone ? false : true});
}

Stream<QuerySnapshot<Task>> getTasks(DateTime dateTime) {
  return getCollectionTask()
      .where("date",
          isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

void deleteTaskFromFireStore(Task task) {
  getCollectionTask().doc(task.id).delete();
}
