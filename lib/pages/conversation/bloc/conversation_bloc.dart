import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/models/index.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc()
      : super(ConversationState(
          showingStatus: Showing.none,
          isClosed: false,
          status: ConversationStatus.initial,
        )) {
    on<InitialConversation>(_onInitial);
    on<SendTextMessage>(_onSendMessage);
    on<ScrollToLastMessage>(_scrollToLastMessage);
    on<HandleFocus>(_onHandleFocus);
    on<HideKeyboardAndSticker>(_onHide);
  }

  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  late final UserProfile myProfile, partnerProfile;

  void _onInitial(InitialConversation event, Emitter<ConversationState> emit) {
    myProfile = event.myProfile;
    partnerProfile = event.partnerProfile;
    emit(state.copyWith(status: ConversationStatus.success));
    // var myId = event.myProfile.id;
    // var partnerId = event.partnerProfile.id;
    // if (myId != null && partnerId != null) {
    //   if (myId.compareTo(partnerId) > 0) {
    //     _groupId = '$myId-$partnerId';
    //   } else {
    //     _groupId = '$partnerId-$myId';
    //   }
    //   emit(state.copyWith(status: ConversationStatus.success));
    // }
  }

  FutureOr<void> _onHandleFocus(
      HandleFocus event, Emitter<ConversationState> emit) {
    if (focusNode.hasFocus && state.showingStatus == Showing.none) {
      emit(state.copyWith(
        showingStatus: Showing.both,
        isClosed: false,
      ));
    } else if (state.showingStatus == Showing.both ||
        state.showingStatus == Showing.keyboard) {
      focusNode.unfocus();
      emit(state.copyWith(
        showingStatus: Showing.sticker,
        isClosed: false,
      ));
    } else if (state.showingStatus == Showing.sticker) {
      focusNode.requestFocus();
      emit(state.copyWith(
        showingStatus: Showing.keyboard,
        isClosed: false,
      ));
    }
  }

  FutureOr<void> _onHide(
      HideKeyboardAndSticker event, Emitter<ConversationState> emit) {
    focusNode.unfocus();
    emit(state.copyWith(
      showingStatus: Showing.none,
      isClosed: true,
    ));
  }

  FutureOr<void> _onSendMessage(
      SendTextMessage event, Emitter<ConversationState> emit) async {
    try {
      if (_groupId.isNotEmpty) {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection("messages")
            .doc(_groupId)
            .collection(_groupId)
            .doc(DateTime.now().millisecondsSinceEpoch.toString());
        if (myProfile.id != null && partnerProfile.id != null) {
          MessageChat messageChat = MessageChat(
            idFrom: myProfile.id!,
            idTo: partnerProfile.id!,
            timestamp: Timestamp.fromDate(DateTime.now()),
            content: event.stickerPath ?? chatController.text,
            type: event.stickerPath != null ? 1 : 0,
          );

          chatController.clear();

          FirebaseFirestore.instance.runTransaction((transaction) async {
            transaction.set(
              documentReference,
              messageChat.toJson(),
            );
          });
          _scrollDown();
        }
      }
    } catch (e) {
      emit(state.copyWith(status: ConversationStatus.failure));
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

  Stream<QuerySnapshot<Object?>>? chatStream() {
    return _groupId.isEmpty
        ? null
        : FirebaseFirestore.instance
            .collection("messages")
            .doc(_groupId)
            .collection(_groupId)
            .orderBy('timestamp', descending: true)
            // .limit(20)
            .snapshots();
  }

  String get _groupId {
    var myId = myProfile.id;
    var partnerId = partnerProfile.id;
    if (myId != null && partnerId != null) {
      if (myId.compareTo(partnerId) > 0) {
        return '$myId-$partnerId';
      } else {
        return '$partnerId-$myId';
      }
    }
    return '';
  }
}
