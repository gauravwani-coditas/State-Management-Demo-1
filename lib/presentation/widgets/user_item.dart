import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/data/models/user.dart';
import 'package:state_demo_1/presentation/screens/updatePage/update_user.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    required this.user,
    super.key,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateUser(
                  user: user,
                ),
              ),
            );
          },
          child: Card(
            elevation: 2,
            color: const Color.fromARGB(255, 249, 246, 218),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                            user.userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text("Email : ${user.userEmail}"),
                          Text("Phone No. :  ${user.userPhoneNo}"),
                          Text("Address :  ${user.userAddress}"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
