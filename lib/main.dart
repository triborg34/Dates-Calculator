import 'package:Dates.Calculator/bindigs.dart';
import 'package:Dates.Calculator/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setWindowSize(Size(600, 600),animate: true);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:  Locale("fa", "IR"),
      supportedLocales: const [
        Locale("fa", "IR"),
        Locale("en", "US"),
      ],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      theme: ThemeData(fontFamily: 'yekan'),
      
      initialBinding: Mybinding(),
      home: HomeScreen(),
      title: "Date",
      localizationsDelegates: const [
        // Add Localization
        PersianMaterialLocalizations.delegate,
        PersianCupertinoLocalizations.delegate,

      ],
  
    );
  }
}

