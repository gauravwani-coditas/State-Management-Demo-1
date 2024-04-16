import 'package:state_demo_1/data/models/user.dart';

sealed class UserState {}

class LoadingState extends UserState {}

class LoadedSuccessState extends UserState {
  LoadedSuccessState(this.userList);
  final List<User> userList;
}

class LoadedFailureState extends UserState {}
