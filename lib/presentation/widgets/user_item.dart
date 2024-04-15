import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/data/models/User.dart';
import 'package:state_demo_1/presentation/screens/updatePage/update_user.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.userIndex, this.userList, {super.key});

  final userIndex;
  final userList;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateUser(userIndex, userList),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                color: const Color.fromARGB(255, 249, 246, 218),
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
                                userList[userIndex].userName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text("Email : ${userList[userIndex].userEmail}"),
                              Text(
                                  "Phone No. :  ${userList[userIndex].userPhoneNo}"),
                              Text(
                                  "Address :  ${userList[userIndex].userAddress}"),
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
