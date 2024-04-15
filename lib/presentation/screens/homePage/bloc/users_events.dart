import 'package:state_demo_1/data/models/User.dart';

abstract class UserEvent {}

class InitialEvent extends UserEvent {}

class OnUserClickedEvent extends UserEvent {
  OnUserClickedEvent(this.user, this.index);
  final int index;
  final User user;
}

class OnDeleteUserEvent extends UserEvent {
  OnDeleteUserEvent(this.user);
  final User user;
}

class OnSaveResponseClicked extends UserEvent {
  OnSaveResponseClicked(this.user);
  final User user;
}
