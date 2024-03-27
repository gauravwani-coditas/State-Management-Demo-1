import 'package:flutter/material.dart';
import 'package:state_demo_1/new_user.dart';
import 'package:state_demo_1/update_user.dart';
import 'package:state_demo_1/users.dart';
import 'package:state_demo_1/widget/user_list_view.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersState();
  }
}

class _UsersState extends State<Users> {
  final List<User> _usersList = [
    User(userName: "Gaurav Wani", userEmail: "gaurav@gmail.com", userPhoneNo: "1234567890", userAddress: "Jalgaon"),
    User(userName: "Vilas Sonje", userEmail: "vilas@gmail.com", userPhoneNo: "2134567890", userAddress: "Nashik"),
    User(userName: "Ritik Mandal", userEmail: "ritik@gmail.com", userPhoneNo: "9876543210", userAddress: "Bhusawal"),
  ];

  void _onUpdateUser(
      String name, String email, String phone, String address, User user) {
    setState(() {
      user.userName = name;
      user.userEmail = email;
      user.userPhoneNo = phone;
      user.userAddress = address;
    });
  }

  void _onUpdateUserScreen(User user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdateUser(updateUserData: _onUpdateUser, user: user)));
  }

  void _onAddUserData(User user) {
    setState(() {
      _usersList.add((user));
    });
  }

  void _onAddUserDataScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewUser(onAddUserData: _onAddUserData)));
  }

  void _onRemoveUser(int index) {
    setState(() {
      _usersList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
        child: Text(
      "Please add some users ",
      style: GoogleFonts.lato(),
    ));

    if (_usersList.isNotEmpty) {
      mainContent =
          UsersListView(userList: _usersList, onUpdateUserScreen: _onUpdateUserScreen, onRemoveUser: _onRemoveUser);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "State Demo 1",
          style: GoogleFonts.lato(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _onAddUserDataScreen();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: mainContent,
      ),
    );
  }
}
