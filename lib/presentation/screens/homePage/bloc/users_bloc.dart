import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_demo_1/data/data_source.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_events.dart';
import 'package:state_demo_1/presentation/screens/homePage/bloc/users_states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(LoadingState()) {
    on<InitialEvent>(initialEvent);
    on<OnUserClickedEvent>(onUserClickedEvent);
    on<OnDeleteUserEvent>(onDeleteUserEvent);
    on<OnSaveResponseClicked>(onSaveResponseClicked);
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(LoadedSuccessState(userList));
  }

  FutureOr<void> onUserClickedEvent(
      OnUserClickedEvent event, Emitter<UserState> emit) async {
    userList[event.index] = event.user;
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(LoadedSuccessState(userList));
  }

  FutureOr<void> onDeleteUserEvent(
      OnDeleteUserEvent event, Emitter<UserState> emit) {
    userList.removeAt(userList.indexOf(event.user));
  }

  FutureOr<void> onSaveResponseClicked(
      OnSaveResponseClicked event, Emitter<UserState> emit) async {
    userList.add(event.user);
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(LoadedSuccessState(userList));
  }
}
