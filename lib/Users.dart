import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_demo_1/new_user.dart';
import 'package:state_demo_1/riverpod/user_riverpod.dart';
import 'package:state_demo_1/update_user.dart';
import 'package:state_demo_1/widget/user_list_view.dart';
import 'package:state_demo_1/models/User.dart';
import 'package:google_fonts/google_fonts.dart';

class Users extends ConsumerWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userRiverpod);

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
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: userDetails.isEmpty
                ? const Center(
                    child: Text("Please add some data !"),
                  )
                : UsersListView(userDetails),
          )),
    );
    ;
  }
}
