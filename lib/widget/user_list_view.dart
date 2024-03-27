import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/providers/user_provider.dart';
import 'package:state_demo_1/widget/user_item.dart';

class UsersListView extends StatelessWidget {
  const UsersListView(this.userList, {super.key});

  final List<User> userList;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) => Dismissible(
            key: ValueKey(userList[index]),
            onDismissed: (direction) => value.removeUser(index),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(25),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete),
            ),
            child: UserItem(userList[index]),
          ),
        );
      },
    );
  }
}
