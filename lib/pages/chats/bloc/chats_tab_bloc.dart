import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/utils/index.dart';

part 'chats_tab_event.dart';
part 'chats_tab_state.dart';

class ChatsTabBloc extends Bloc<ChatsTabEvent, ChatsTabState> {
  ChatsTabBloc() : super(ChatsTabInitial()) {
    on<GetAllFriends>(_onGetAllFriends);
  }

  FutureOr<void> _onGetAllFriends(
      GetAllFriends event, Emitter<ChatsTabState> emit) async {
    try {
      List<UserProfile> listUsers = [];
      emit(Loading());
      var uid = await locator<AppStorage>().getValue(AppStorageKey.uid);
      var userProfile =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      var data = userProfile.data()?["messageWith"];
      if (data != null) {
        for (var item in data) {
          var docSnap = await FirebaseFirestore.instance
              .collection('users')
              .doc(item)
              .get();
          if (docSnap.data() != null) {
            listUsers.add(UserProfile.fromMap(docSnap.data()!));
          }
        }
      }
      emit(Success(listUsers: listUsers));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
