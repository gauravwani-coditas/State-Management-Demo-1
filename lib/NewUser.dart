import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';

class NewUser extends StatefulWidget {
  NewUser(this.onAddUserData, {super.key});

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

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        
      }
    });
  }

  void _onSubmitData(BuildContext context) {
    final enteredName = _textNameController.text;
    final enteredEmail = _textEmailController.text;
    final enteredPhone = _textPhoneController.text;
    final enteredAddress = _textAddressController.text;

    if (enteredName.isEmpty ||
        enteredEmail.isEmpty ||
        enteredPhone.isEmpty ||
        enteredAddress.isEmpty) {
      showDialog(
        context: context,
        builder: (cxt) => AlertDialog(
          title: Text(
            "Invalid Input",
            style: GoogleFonts.lato(),
          ),
          content: Text(
            "Please fill all the required details",
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
      return;
    }


    User user = User(enteredName, enteredEmail, enteredPhone, enteredAddress);

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
                  "Name",
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
                  "Email address",
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
                  "Phone No. ",
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
                  "Address",
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
                      onPressed: () {
                        _onSubmitData(context);
                      },
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
