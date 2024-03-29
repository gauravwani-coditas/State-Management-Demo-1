import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/riverpod/user_riverpod.dart';
import 'package:state_demo_1/update_user.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.userIndex, {super.key});

  final userIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userDetail = ref.watch(userRiverpod);
        return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateUser(userDetail[userIndex]),
                  ),
                );
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
                                userDetail[userIndex].userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                  "Email : ${userDetail[userIndex].userEmail}"),
                              Text(
                                  "Phone No. :  ${userDetail[userIndex].userPhoneNo}"),
                              Text(
                                  "Address :  ${userDetail[userIndex].userAddress}"),
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
