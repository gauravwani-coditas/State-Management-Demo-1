import 'package:flutter/material.dart';
import 'package:state_demo_1/NewUser.dart';
import 'package:state_demo_1/UpdateUser.dart';
import 'package:state_demo_1/Users.dart';
import 'package:state_demo_1/widget/UsersListView.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersState();
  }
}

class _UsersState extends State<Users> {


  final List<User> _usersList = [];

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
            builder: (context) => UpdateUser(_onUpdateUser, user)));
  }

  void _onAddUserData(User user) {
    setState(() {
      _usersList.add((user));
    });
  }

  void _onAddUserDataScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewUser(_onAddUserData)));
  }

  void _onRemoveUser(User user) {
    int currentUserIndex = _usersList.indexOf(user);
    setState(() {
      print(_usersList.length);
      _usersList.remove(_usersList[currentUserIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent =  Center( child: Text("Please add some users ",style: GoogleFonts.lato(),));

    if(_usersList.isNotEmpty){
      mainContent =  UsersListView(_usersList, _onUpdateUserScreen, _onRemoveUser);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("State Demo 1",style: GoogleFonts.lato(),),
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
        child:  mainContent,
      ),
    );
  }
}
