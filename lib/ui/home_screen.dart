import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/color.dart';
import 'package:from_chang_chang_with_love/const/image.dart';
import 'package:from_chang_chang_with_love/screens/quiz_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    playBackgroundMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.orange.withOpacity(0.9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Chào mừng Xuân Bốn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Đến với chiếc App dành riêng cho anh',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '❤️ 🧡 💛 💚 💙 💜 🤎 🖤 🤍',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              "assets/loading.json",
              width: 200,
              height: 200,
              repeat: true,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            _buttonStart(),
          ],
        ),
      ),
    );
  }

  Widget _buttonStart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const QuizScreen();
          }));
        },
        child: const SizedBox(
          height: 65,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            color: OneColors.yellowLight,
            child: Center(
              child: Text(
                'Start ❤️',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void playBackgroundMusic() async {
    final player = AudioPlayer();
    await player.play(AssetSource("music.mp3"));
  }
}
