import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_bloc.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_states.dart';
import 'package:state_demo_1/presentation/screens/newPage/new_user.dart';
import 'package:state_demo_1/presentation/widgets/user_list_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "State Demo 1",
          style: GoogleFonts.lato(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewUser()),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedSuccessState) {
            final userList = state.userList;
            return UsersListView(userList);
          } else {
            return const Center(
              child: Text("No Content !"),
            );
          }
        },
      ),
    );
  }
}
