import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/data/models/user.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_events.dart';
import 'package:state_demo_1/presentation/widgets/user_item.dart';

class UsersListView extends ConsumerWidget {
  const UsersListView(this.userList, {super.key});

  final List<User> userList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(userList[index]),
        onDismissed: (direction) => BlocProvider.of<UserBloc>(context)
            .add(OnDeleteUserEvent(userList[index])),
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.centerLeft,
          child: const Padding(
              padding: EdgeInsets.all(35), child: Icon(Icons.delete)),
        ),
        child: UserItem(user: userList[index]),
      ),
    );
  }
}
