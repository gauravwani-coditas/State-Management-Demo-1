import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:state_demo_1/riverpod/user_riverpod.dart';
import 'package:state_demo_1/widget/user_item.dart';

class UsersListView extends ConsumerWidget {
  const UsersListView(this.userList, {super.key});

  final List<User> userList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(userList[index]),
        onDismissed: (direction) =>
            ref.read(userRiverpod.notifier).removeUser(index),
        background: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(25),
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete),
        ),
        child: UserItem(index),
      ),
    );
  }
}
