import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:yongatek/productspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Timer _timer = Timer.periodic(const Duration(seconds: 3), (bol){});

  void onButtonClicked(BuildContext context, bool tr) {
    var lg = tr ? "tr" : "en";
    audioPlayer.play(AssetSource("sound/$lg.mp3")).then(
      (_) {
        audioPlayer.stop();
        if (_timer.isActive){
          _timer.cancel();
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductsPage(tr: tr),
          ),
        ).then((value) {
          _startTimer();
        });

      },
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
    _timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), _handleTimerTick);
  }

  void _handleTimerTick(Timer timer) {
    audioPlayer.play(AssetSource("sound/main.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2596be),
        title: Image.asset(
          "assets/logo.jpg",
          height: 50,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black38),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: size * 0.1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    )),
                onPressed: () {
                  onButtonClicked(context, true);
                },
                child: Text(
                  "               Başla               ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.015,
                    color: const Color(0xFF2596be),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: size * 0.1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    )),
                onPressed: () {
                  onButtonClicked(context, false);
                },
                child: Text(
                  "               Start               ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.015,
                    color: const Color(0xFF2596be),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
