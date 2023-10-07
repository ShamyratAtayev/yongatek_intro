import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongatek/data.dart';
import 'package:yongatek/productdetails.dart';

class ProductsPage extends StatefulWidget {
  final bool tr;
  const ProductsPage({required this.tr, super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    var text = widget.tr ? "wel2" : "wel"; 
    audioPlayer.play(AssetSource("sound/$text.mp3"));
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF2596be),
        title: Text(
          widget.tr ? "Ürünlerimiz" : "Products",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.02,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 1.5,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
            ),
            itemCount: 10,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(index: index ,tr: widget.tr),
                    ),
                  );
                  audioPlayer.stop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/${index + 1}.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      name[index],
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.02,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
