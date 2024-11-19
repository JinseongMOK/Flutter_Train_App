import 'package:flutter/material.dart';
import 'package:flutter_train_app/screen/seat_page.dart';
import 'package:flutter_train_app/screen/station_list_page.dart';
import 'package:flutter_train_app/screen/home_screen.dart';
import 'package:flutter_train_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: dartTheme,
      initialRoute: '/',
      routes: {
        '/Station_List_Page': (BuildContext context) => StationListPage(),
        '/Seat_Page': (BuildContext context) => SeatPage(),
      },
      home: HomeScreen(),
    );
  }
}
