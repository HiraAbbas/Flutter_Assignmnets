import 'package:flutter/material.dart';
import 'package:flutter_stacked_mvvm_app/app/app.locator.dart';
import 'package:flutter_stacked_mvvm_app/app/app.router.dart';
import 'package:flutter_stacked_mvvm_app/views/counter_view.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
