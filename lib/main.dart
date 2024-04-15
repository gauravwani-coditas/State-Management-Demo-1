import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_events.dart';
import 'package:state_demo_1/presentation/screens/homePage/users.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => UserBloc()..add(InitialEvent()),
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
