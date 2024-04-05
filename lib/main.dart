import "package:flutter/material.dart";
import "package:state_demo_1/users.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
       
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const Users(),
      ),
    ),
  );
}
