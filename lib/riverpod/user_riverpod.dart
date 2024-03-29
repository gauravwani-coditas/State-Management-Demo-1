import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/models/User.dart';

final userRiverpod =
    StateNotifierProvider<UserProvider, List<User>>((ref) => UserProvider());

class UserProvider extends StateNotifier<List<User>> {
  UserProvider()
      : super([
          User(
              userName: "Gaurav Wani",
              userEmail: "gaurav@gmail.com",
              userPhoneNo: "9876543210",
              userAddress: "Jalgaon"),
          User(
              userName: "Vilas Sonje",
              userEmail: "vilas@gmail.com",
              userPhoneNo: "7658943210",
              userAddress: "Nashik"),
          User(
              userName: "Ritik Mandal",
              userEmail: "ritik@gmail.com",
              userPhoneNo: "879654210",
              userAddress: "Bhusawal"),
        ]);

  void updateUser(User newUser, int index) {
    state[index] = newUser;
  }

  void removeUser(int index) {
    state.removeAt(index);
  }
}
