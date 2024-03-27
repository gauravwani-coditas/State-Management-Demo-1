import 'dart:io';

import 'package:flutter/material.dart';

import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';

class NewUser extends StatefulWidget {
  const NewUser({required this.onAddUserData, super.key});

  final void Function(User user) onAddUserData;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewUserState();
  }
}

class _NewUserState extends State<NewUser> {
  final _textNameController = TextEditingController();
  final _textEmailController = TextEditingController();
  final _textPhoneController = TextEditingController();
  final _textAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textNameController.addListener(_onNameChanged);
    _textEmailController.addListener(_onEmailChanged);
    _textPhoneController.addListener(_onPhoneChanged);
    _textAddressController.addListener(_onAddressChanged);
  }

  bool _isNameEmpty = true;
  bool _isEmailEmpty = true;
  bool _isPhoneEmpty = true;
  bool _isAddressEmpty = true;

  void _onNameChanged() {
    setState(() {
      if (_textNameController.text.isNotEmpty) {
        _isNameEmpty = false;
      }
    });
  }

  void _onEmailChanged() {
    setState(() {
      if (_textEmailController.text.isNotEmpty) {
        _isEmailEmpty = false;
      }
    });
  }

  void _onPhoneChanged() {
    setState(() {
      if (_textPhoneController.text.isNotEmpty) {
        _isPhoneEmpty = false;
      }
    });
  }

  void _onAddressChanged() {
    setState(() {
      if (_textAddressController.text.isNotEmpty) {
        _isAddressEmpty = false;
      }
    });
  }

  void _onSubmitData(BuildContext context) {
    final enteredName = _textNameController.text;
    final enteredEmail = _textEmailController.text;
    final enteredPhone = _textPhoneController.text;
    final enteredAddress = _textAddressController.text;

    String alertMessage = "";
    bool isAlertMessageRequired = true;

    if (enteredName.isNotEmpty) {
      if (enteredEmail.isNotEmpty) {
        if (enteredPhone.isNotEmpty) {
          if (enteredAddress.isNotEmpty) {
            isAlertMessageRequired = false;
          } else {
            alertMessage = "Please enter Address";
          }
        } else {
          alertMessage = "Please enter Phone number !";
        }
      } else {
        alertMessage = "Please enter Email !";
      }
    } else {
      alertMessage = "Please enter Name !";
    }

    if (isAlertMessageRequired) {
      showDialog(
        context: context,
        builder: (cxt) => AlertDialog(
          title: Text(
            "Invalid Input",
            style: GoogleFonts.lato(),
          ),
          content: Text(
            alertMessage,
            style: GoogleFonts.lato(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(cxt);
                },
                child: Text(
                  "Okay",
                  style: GoogleFonts.lato(),
                ))
          ],
        ),
      );
    }

    if (enteredName.isEmpty ||
        enteredEmail.isEmpty ||
        enteredPhone.isEmpty ||
        enteredAddress.isEmpty) {
      return;
    }

    User user = User(
        userName: enteredName,
        userEmail: enteredEmail,
        userPhoneNo: enteredPhone,
        userAddress: enteredAddress);

    widget.onAddUserData(user);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New User",
          style: GoogleFonts.lato(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: _textNameController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Name *",
                  style: GoogleFonts.lato(),
                ),
              ),
            ),
            TextField(
              controller: _textEmailController,
              maxLength: 30,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Email address *",
                  style: GoogleFonts.lato(),
                ),
              ),
            ),
            TextField(
              controller: _textPhoneController,
              maxLength: 10,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Phone No. *",
                  style: GoogleFonts.lato(),
                ),
              ),
            ),
            TextField(
              controller: _textAddressController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Address *",
                  style: GoogleFonts.lato(),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.lato(),
                      )),
                  ElevatedButton(
                      onPressed: _isNameEmpty ||
                              _isEmailEmpty ||
                              _isPhoneEmpty ||
                              _isAddressEmpty
                          ? null
                          : () => _onSubmitData(context),
                      child: Text(
                        "Save Response",
                        style: GoogleFonts.lato(),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
