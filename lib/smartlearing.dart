import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class TextVoice extends StatefulWidget {
  @override
  State<TextVoice> createState() => _TextVoiceState();
}

class _TextVoiceState extends State<TextVoice> {
  TextToSpeech tts = TextToSpeech();

  bool play = false;
  var currentIndex;
  var num = 1;
  textRecg(var text) {
    if (text == "A" ||
        text == "E" ||
        text == "I" ||
        text == "O" ||
        text == "U") {
      return "an";
    } else {
      return "a";
    }
  }

  var alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  List<String> name = [
    "Apple",
    "Ball",
    "Cat",
    "Drum",
    "Elephant",
    "Fan",
    "Gate",
    "Hand",
    "Inkpot",
    "Jug",
    "Key",
    "Lamp",
    "Mug",
    "Nest",
    "Ox",
    "Pencil",
    "Queen",
    "Rose",
    "Spoon",
    "Table",
    "Umbrella",
    "Van",
    "Watch",
    "X-Ray",
    "Y'olk",
    "Zebra"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: alphabet.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      alphabet[index],
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name[index],
                          style: const TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("This is" +
                            " " +
                            textRecg(alphabet[index]) +
                            " " +
                            name[index] +
                            "\nThis is my ${name[index]}"),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('images/img$index.png', height: 80, width: 80),
                    IconButton(
                        onPressed: () {
                          for (int i = 0; i < name.length; i++) {
                            if (i == index) {
                              setState(() {
                                play == false;
                                currentIndex = index;
                              });
                            } else {
                              setState(() {
                                play == true;
                                tts.stop();
                                currentIndex != index;
                              });
                            }
                          }
                          _speak("This is" +
                              " " +
                              textRecg(alphabet[currentIndex]) +
                              " " +
                              name[currentIndex] +
                              "\nThis is my ${name[currentIndex]}");
                        },
                        icon: currentIndex == index
                            ? Icon(currentIndex == index
                                ? Icons.pause_circle
                                : Icons.play_circle)
                            : Icon(currentIndex != index
                                ? Icons.play_circle
                                : Icons.pause_circle))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }

  _speak(text) {
    double rate = 0.8;
    tts.setRate(rate);
    String language = 'en-US';
    tts.setLanguage(language);
    tts.speak(text);
  }

  _stop() {
    tts.stop();
  }
}
