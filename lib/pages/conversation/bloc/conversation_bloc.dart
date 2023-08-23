import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/models/index.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(ConversationInitial()) {
    on<SendTextMessage>(_onSendMessage);
    on<ScrollToLastMessage>(_scrollToLastMessage);
  }

  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  FutureOr<void> _onSendMessage(
      SendTextMessage event, Emitter<ConversationState> emit) async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("messages")
          .doc(event.groupId)
          .collection(event.groupId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      MessageChat messageChat = MessageChat(
        idFrom: event.myProfile.id ?? '',
        idTo: event.partnerProfile.id ?? '',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: chatController.text,
        type: 0,
      );

      chatController.clear();

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(
          documentReference,
          messageChat.toJson(),
        );
      });
      _scrollDown();
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  FutureOr<void> _scrollToLastMessage(
      ScrollToLastMessage event, Emitter<ConversationState> emit) {
    _scrollDown(hasAnimation: true);
  }

  void _scrollDown({bool hasAnimation = false}) {
    hasAnimation
        ? scrollController.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          )
        : scrollController.jumpTo(0);
  }

  Stream<QuerySnapshot<Object?>>? chatStream({required String groupId}) {
    return FirebaseFirestore.instance
        .collection("messages")
        .doc(groupId)
        .collection(groupId)
        .orderBy('timestamp', descending: true)
        // .limit(20)
        .snapshots();
  }
}
