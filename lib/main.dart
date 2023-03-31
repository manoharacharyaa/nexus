import 'package:flutter/material.dart';

void main() {
  runApp(const Nexus());
}

class Nexus extends StatelessWidget {
  const Nexus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
    );
  }
}
