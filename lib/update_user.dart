import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/providers/user_provider.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser(this.user, {super.key});

  User user;

  late TextEditingController _textNameController;
  late TextEditingController _textEmailController;
  late TextEditingController _textPhoneController;
  late TextEditingController _textAddressController;

  @override
  Widget build(BuildContext context) {
    _textNameController = TextEditingController(text: user.userName);
    _textEmailController = TextEditingController(text: user.userEmail);
    _textPhoneController = TextEditingController(text: user.userPhoneNo);
    _textAddressController = TextEditingController(text: user.userAddress);

    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Update User"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                TextField(
                  controller: _textNameController,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                ),
                TextField(
                  controller: _textEmailController,
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Email address"),
                  ),
                ),
                TextField(
                  controller: _textPhoneController,
                  maxLength: 10,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Phone No. "),
                  ),
                ),
                TextField(
                  controller: _textAddressController,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Address"),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {
                            User newUser = User(
                                userName: _textNameController.text,
                                userEmail: _textEmailController.text,
                                userPhoneNo: _textPhoneController.text,
                                userAddress: _textAddressController.text);

                            int userIndex = value.usersList.indexOf(user);
                          value.updateUser(newUser,userIndex);
                           Navigator.pop(context);
                          },
                          child: const Text("Save Response")),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
