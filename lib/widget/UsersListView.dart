import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/widget/UserItem.dart';

class UsersListView extends StatelessWidget {
  const UsersListView(this.userList, this.onUpdateUserScreen,this._onRemoveUser, {super.key});

  final List<User> userList;
  final void Function(User user) onUpdateUserScreen;
  final void Function(User user) _onRemoveUser; 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(userList[index]),
          onDismissed: (direction) => (){_onRemoveUser(userList[index]);},
          child: UserItem(userList[index], onUpdateUserScreen)),
    );
  }
}
