import 'package:flutter/material.dart';
import 'package:nexus/pallete.dart';
import 'home_page.dart';

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
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Pallete.kAppBarTheme),
      ),
      home: const HomePage(),
    );
  }
}
