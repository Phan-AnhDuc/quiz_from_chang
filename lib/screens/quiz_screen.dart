import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/image.dart';
import 'package:from_chang_chang_with_love/dialog/dialog.dart';
import 'package:from_chang_chang_with_love/models/questions.dart';
import 'package:from_chang_chang_with_love/screens/result_screen.dart';
import 'package:from_chang_chang_with_love/widgets/answer_card.dart';
import 'package:from_chang_chang_with_love/widgets/next_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
      setState(() {});
      if (questions[questionIndex].index == 1) {
        OneDialog.show(
          context,
          msg: '',
          okText: 'Tiếp tục',
          title: 'Mới câu đầu khởi động hoy ❤️',
          alertStyle: OneDialogAlertStyle.success,
          okHandler: () {
            Navigator.pop(context);
          },
        );
        return;
      }
      if (questions[questionIndex].index == 2) {
        OneDialog.show(
          context,
          msg: '',
          id: 4,
          okText: 'Tiếp tục',
          title: 'Bùm!!! Nhiệt liệt chào đón sinh nhật của Xuân Bốn',
          alertStyle: OneDialogAlertStyle.success,
          okHandler: () {
            Navigator.pop(context);
          },
        );
        return;
      }
      if (questions[questionIndex].index == 3) {
        OneDialog.show(
          context,
          msg: '',
          okText: 'Tiếp tục',
          id: 2,
          title: 'Chúc anh bạn nhỏ của em ngày càng trưởng thành hơn, bước đi thật vững chắc trên hành trình phía trước, chúc anh thành công, gặp được nhiều điều may mắn',
          alertStyle: OneDialogAlertStyle.success,
          okHandler: () {
            Navigator.pop(context);
          },
        );
        return;
      }
      if (questions[questionIndex].index == 4) {
        OneDialog.show(
          context,
          msg: '',
          id: 3,
          okText: 'Tiếp tục',
          title: 'Mong anh sẽ luôn vui vẻ, khỏe mạnh, luôn được hạnh phúc. Cầu cho con đường sau này anh đi mọi thứ sẽ nhẹ nhàng hơn với anh',
          alertStyle: OneDialogAlertStyle.success,
          okHandler: () {
            Navigator.pop(context);
          },
        );
        return;
      }
      if (questions[questionIndex].index == 5) {
        OneDialog.show(
          context,
          msg: '',
          id: 1,
          okText: 'Tiếp tục',
          title: 'Em yêu anh! Chúc mừng sinh nhật bạn chồng',
          alertStyle: OneDialogAlertStyle.success,
          okHandler: () {
            Navigator.pop(context);
          },
        );
        return;
      }
    } else {
      OneDialog.show(
        context,
        msg: 'Sai rồi tự giác phạt nha iuuu ❤️',
        title: 'STK: 1029950290 \n Vietcombank',
        okText: 'Đóng',
        alertStyle: OneDialogAlertStyle.success,
        okHandler: () {
          Navigator.pop(context);
        },
      );
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.orange.withOpacity(0.7),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question.question,
                style: const TextStyle(
                  fontSize: 21,
                ),
                textAlign: TextAlign.center,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null ? () => pickAnswer(index) : null,
                    child: AnswerCard(
                      currentIndex: index,
                      question: question.options[index],
                      isSelected: selectedAnswerIndex == index,
                      selectedAnswerIndex: selectedAnswerIndex,
                      correctAnswerIndex: question.correctAnswerIndex,
                    ),
                  );
                },
              ),
              // Next Button
              isLastQuestion
                  ? RectangularButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ResultScreen(
                              score: score,
                            ),
                          ),
                        );
                      },
                      label: 'Finish',
                    )
                  : RectangularButton(
                      onPressed: selectedAnswerIndex != null ? goToNextQuestion : null,
                      label: 'Next',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
