import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/providers/user_provider.dart';
import 'package:state_demo_1/update_user.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.currentUser, {super.key});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute( builder: (context) => UpdateUser(currentUser),),);
              },
              child: Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/Images/imageAvatar.jpeg",
                        width: 100,
                        height: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentUser.userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text("Email : ${currentUser.userEmail}"),
                              Text("Phone No. :  ${currentUser.userPhoneNo}"),
                              Text("Address :  ${currentUser.userAddress}"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
