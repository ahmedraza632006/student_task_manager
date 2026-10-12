import 'package:flutter/material.dart';

void main() {
  runApp(const StudentTaskManagerApp());
}

const Color primaryColor = Color(0xFF5146E5);
const Color darkColor = Color(0xFF202044);
const Color backgroundColor = Color(0xFFF6F7FB);

class StudentTaskManagerApp extends StatelessWidget {
const StudentTaskManagerApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Student Task Manager',
theme: ThemeData(
useMaterial3: true,
scaffoldBackgroundColor: backgroundColor,
colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
appBarTheme: const AppBarTheme(
backgroundColor: backgroundColor,
foregroundColor: darkColor,
elevation: 0,
centerTitle: false,
),
inputDecorationTheme: InputDecorationTheme(
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: BorderSide.none,
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: const BorderSide(color: Color(0xFFE7E8F0)),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),
borderSide: const BorderSide(
color: primaryColor,
width: 1.5,
),
),
),
),
home: const WelcomePage(),
);
}