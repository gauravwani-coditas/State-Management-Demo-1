import 'package:flutter/material.dart';
import 'package:state_demo_1/models/User.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser(this.updateUserData,this.user, {super.key});

  final void Function(String name,String email,String phone,String address,User currentUser) updateUserData;
  final User user;

  @override
  State<StatefulWidget> createState() {
    return _UpdateUserState();
  }
}

class _UpdateUserState extends State<UpdateUser> {
  
  late TextEditingController _textNameController;
  late TextEditingController _textEmailController;
  late TextEditingController _textPhoneController;
  late TextEditingController _textAddressController;

  @override
  void initState() {
    _textNameController = TextEditingController(text: widget.user.userName);
    _textEmailController = TextEditingController(text: widget.user.userEmail);
    _textPhoneController = TextEditingController(text: widget.user.userPhoneNo);
    _textAddressController =
        TextEditingController(text: widget.user.userAddress);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers to avoid memory leaks
    _textNameController.dispose();
    _textEmailController.dispose();
    _textPhoneController.dispose();
    _textAddressController.dispose();
    super.dispose();
  }

  void _onSubmitUpdateUserData() {
    
      widget.updateUserData(_textNameController.text,_textEmailController.text,_textPhoneController.text,_textAddressController.text,widget.user);
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
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
                      onPressed: (){_onSubmitUpdateUserData();}, child: const Text("Save Response")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
