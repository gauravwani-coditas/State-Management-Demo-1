import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/data/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_events.dart';

class NewUser extends ConsumerStatefulWidget {
  const NewUser({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewUserState();
  }
}

class _NewUserState extends ConsumerState<NewUser> {
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

  void onSubmitData(BuildContext context, WidgetRef ref) {
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

    print("\n\nClicking on Add button \n\n");
    BlocProvider.of<UserBloc>(context).add(OnSaveResponseClicked(user));

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
                      onPressed: _isNameEmpty ||
                              _isEmailEmpty ||
                              _isPhoneEmpty ||
                              _isAddressEmpty
                          ? null
                          : () {
                              onSubmitData(context, ref);
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
        //here consumer
      ),
    );
  }
}
