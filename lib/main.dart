import 'package:class_assignment_second/app.dart';
import 'package:class_assignment_second/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
}
