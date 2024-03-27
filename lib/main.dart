import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_demo_1/providers/user_provider.dart";
import "package:state_demo_1/users.dart";

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Users(),
      ),
    ),
  );
}
