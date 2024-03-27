import 'package:flutter/material.dart';
import 'package:state_demo_1/models/User.dart';

class UserProvider with ChangeNotifier {
  final List<User> usersList = [
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
  ];

  List<User> getList() {
    return usersList;
  }

  void updateUser(User newUser,int index) {
    
    usersList[index].userName = newUser.userName;
    usersList[index].userEmail = newUser.userEmail;
    usersList[index].userPhoneNo = newUser.userPhoneNo;
    usersList[index].userAddress = newUser.userAddress;
    notifyListeners();
  }

  void onAddUserData(User user) {
    usersList.add(user);
    notifyListeners();
  }

  void removeUser(int index) {
    usersList.removeAt(index);
    notifyListeners();
  }
}
