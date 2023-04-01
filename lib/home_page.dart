import 'package:flutter/material.dart';
import 'package:nexus/feature_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0XFF24243e), Color(0XFF302b63)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text('Nexus'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerRight,
                colors: [Color(0XFF24243e), Color(0XFF302b63)],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Image.asset(
                    'assets/images/voiceAssistant.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              FeatureBox(
                headerText: 'Chat-Bot',
                discriptionText:
                    'A smarter way to stay organized and informed with Chat-Boat',
              ),
              FeatureBox(
                headerText: 'Dall-E',
                discriptionText:
                    'Get inspired and stay creative with your personal assistant powered by Dall-E',
              ),
              FeatureBox(
                headerText: 'Smart Voice Assistant',
                discriptionText:
                    'Get the best of both worlds with a voice assistant powered by AI',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
