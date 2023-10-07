import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongatek/data.dart';

class ProductDetails extends StatefulWidget {
  final int index;
  final bool tr;
  const ProductDetails({Key? key, required this.index, required this.tr})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playMusic();
  }

  void playMusic() async {
    var lg = widget.tr ? "tr" : "en";
    await audioPlayer
        .play(AssetSource("sound/${lg + (widget.index + 1).toString()}.mp3"));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1f3f4f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2596be),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name[widget.index],
              style: GoogleFonts.inter(
                fontSize: size.width * 0.016,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Image.asset(
              "assets/logo.jpg",
              height: 35,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.47,
                  child: Image.asset("assets/img/${widget.index + 1}.jpg"),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                  width: size.width * 0.47,
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.tr ? trText[widget.index] : enText[widget.index],
                    style: GoogleFonts.inter(
                      fontSize: size.width * 0.016,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
