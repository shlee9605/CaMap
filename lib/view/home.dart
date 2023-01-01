import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CaMap'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('개발자 연락처 : shlee9605@naver.com'),
          onPressed: () {
            // Back to home
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
