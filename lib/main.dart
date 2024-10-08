import 'package:flutter/material.dart';
import 'package:todolist_app/app/app.dart';
import 'package:todolist_app/init.dart';

Future<void> main() async {
  await initLib();
  runApp(const TodolistApp());
}
