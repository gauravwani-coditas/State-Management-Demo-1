import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/users.dart';

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

  void updateUser(User newUser, int index,WidgetRef ref) {
    state[index] = newUser;
    ref.read(userRiverpod.notifier).state = List.from(state);
  }

  void removeUser(int index,WidgetRef ref) {
    state.removeAt(index);
    ref.read(userRiverpod.notifier).state = List.from(state);
  }

   void onAddUserData(User newUser,WidgetRef ref) {
    state.add(newUser);
    ref.read(userRiverpod.notifier).state = List.from(state);
  }
}
