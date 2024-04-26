import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/color.dart';
import 'package:from_chang_chang_with_love/const/image.dart';
import 'package:from_chang_chang_with_love/models/questions.dart';
import 'package:from_chang_chang_with_love/ui/finish.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.orange.withOpacity(0.7),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 1000),
            const Text(
              'Xem kết quả nè',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 5,
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FinishScreen();
                }));
              },
              child: const SizedBox(
                height: 60,
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  color: OneColors.yellowLight,
                  child: Center(
                    child: Text(
                      'Tiếp tục',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
