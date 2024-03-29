import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/riverpod/user_riverpod.dart';

class UpdateUser extends ConsumerWidget {
  UpdateUser(this.user, {super.key});

  User user;

  late TextEditingController _textNameController;
  late TextEditingController _textEmailController;
  late TextEditingController _textPhoneController;
  late TextEditingController _textAddressController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.read(userRiverpod);

    _textNameController = TextEditingController(text: user.userName);
    _textEmailController = TextEditingController(text: user.userEmail);
    _textPhoneController = TextEditingController(text: user.userPhoneNo);
    _textAddressController = TextEditingController(text: user.userAddress);

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

                        int userIndex = userDetails.indexOf(user);
                        ref
                            .read(userRiverpod.notifier)
                            .updateUser(newUser, userIndex);
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
  }
}
