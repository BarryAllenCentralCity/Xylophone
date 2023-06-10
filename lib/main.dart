import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playAudio(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource('assets_note$noteNumber.wav'),
    );
  }

  Expanded xyloButton(Color buttonColor, int audioFile) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: buttonColor,
        ),
        child: MaterialButton(
          onPressed: () {
            playAudio(audioFile);
          },
          child: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              xyloButton(Colors.red, 1),
              xyloButton(Colors.deepOrange, 2),
              xyloButton(Colors.yellow, 3),
              xyloButton(Colors.lightGreen, 4),
              xyloButton(Colors.teal.shade400, 5),
              xyloButton(Colors.blue, 6),
              xyloButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
