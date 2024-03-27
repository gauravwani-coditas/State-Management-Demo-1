
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_demo_1/providers/user_provider.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<StatefulWidget> createState() {
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
      } else {
        _isNameEmpty = true;
      }
    });
  }

  void _onEmailChanged() {
    setState(() {
      if (_textEmailController.text.isNotEmpty) {
        _isEmailEmpty = false;
      } else {
        _isEmailEmpty = true;
      }
    });
  }

  void _onPhoneChanged() {
    setState(() {
      if (_textPhoneController.text.isNotEmpty) {
        _isPhoneEmpty = false;
      } else {
        _isPhoneEmpty = true;
      }
    });
  }

  void _onAddressChanged() {
    setState(() {
      if (_textAddressController.text.isNotEmpty) {
        _isAddressEmpty = false;
      } else {
        _isAddressEmpty = true;
      }
    });
  }

  void onSubmitData(BuildContext context) {
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

    User user = User(
        userName: enteredName,
        userEmail: enteredEmail,
        userPhoneNo: enteredPhone,
        userAddress: enteredAddress);

    Provider.of<UserProvider>(context, listen: false).onAddUserData(user);

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
        child: Consumer<UserProvider>(builder: (context, value, child) {
          return Column(
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
                        onPressed: _isNameEmpty ||
                                _isEmailEmpty ||
                                _isPhoneEmpty ||
                                _isAddressEmpty
                            ? null
                            : () {
                                onSubmitData(context);
                              },
                        child: Text(
                          "Save Response",
                          style: GoogleFonts.lato(),
                        )),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
