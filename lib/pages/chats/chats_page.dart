import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FlutterLogo(),
    );
  }
}
