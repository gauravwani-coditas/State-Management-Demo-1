import "package:flutter/material.dart";

import "package:state_demo_1/users.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Users(),
      ),
    ),
  );
}
