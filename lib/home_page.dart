import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nexus/feature_box.dart';
import 'package:nexus/openai_service.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speeechToText = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speeechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speeechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speeechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speeechToText.stop();
    flutterTts.stop();
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

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
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: Image.asset(
                    'assets/images/voiceAssistant.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22)
                    .copyWith(top: 15),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(15).copyWith(topLeft: Radius.zero),
                  border: Border.all(
                    color: Color(0XFF7062E8),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'Good Morning, what task can I do for you?',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10, left: 25),
                child: const Text(
                  'Here are a few features',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (await speeechToText.hasPermission &&
                speeechToText.isNotListening) {
              await startListening();
            } else if (speeechToText.isListening) {
              final speech = await openAIService.isArtpromptAPI(lastWords);
              await systemSpeak(speech);
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          child: const Icon(Icons.mic),
          backgroundColor: Color(0XFF7062E8),
        ),
      ),
    );
  }
}
