import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/widget/user_item.dart';

class UsersListView extends StatelessWidget {
  const UsersListView(
      {required this.userList,
      required this.onUpdateUserScreen,
      required this.onRemoveUser,
      super.key});

  final List<User> userList;
  final void Function(User user) onUpdateUserScreen;
  final void Function(int index) onRemoveUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(userList[index]),
          onDismissed: (direction) => onRemoveUser(index),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: UserItem(
              currentUser: userList[index],
              onUpdateUserScreen: onUpdateUserScreen)),
    );
  }
}
