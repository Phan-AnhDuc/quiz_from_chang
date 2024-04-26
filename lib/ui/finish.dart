import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/color.dart';
import 'package:from_chang_chang_with_love/const/image.dart';
import 'package:from_chang_chang_with_love/dialog/dialog.dart';
import 'package:from_chang_chang_with_love/ui/home_screen.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  bool letter1 = false;
  bool letter2 = false;
  bool letter3 = false;
  bool letter4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.back), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nhắn anh ...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        letter1 = true;
                      });
                      OneDialog.show(
                        context,
                        msg: '',
                        okText: 'Đóng',
                        title: 'Cùng nhau vượt qua mọi khó khăn trong cuộc sống, cùng nhau thực hiện ước mơ, lúc nào mệt thì cứ nghỉ ngơi với suy 1 xíu rồi cùng cố gắng tiếp anh nhé!! ❤️',
                        alertStyle: OneDialogAlertStyle.success,
                        okHandler: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: !letter1
                        ? SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_clode),
                          )
                        : SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_open),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        letter2 = true;
                      });
                      OneDialog.show(
                        context,
                        msg: '',
                        okText: 'Đóng',
                        title: 'Cảm ơn vì đã trở về, cảm ơn vì sau tất cả chúng ta vẫn bước tiếp cùng nhau, cảm ơn vì là 1 phần của cuộc đời em. ❤️',
                        alertStyle: OneDialogAlertStyle.success,
                        okHandler: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: !letter2
                        ? SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_clode),
                          )
                        : SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_open),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        letter3 = true;
                      });
                      OneDialog.show(
                        context,
                        msg: '',
                        okText: 'Đóng',
                        title: 'Nếu được, mong anh mãi sau này vẫn sẽ thương em, chiều em và bao dung với em. Em thương anh bằng tất cả sự dịu dàng mà em có, vẫn chỉ là anh ❤️',
                        alertStyle: OneDialogAlertStyle.success,
                        okHandler: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: !letter3
                        ? SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_clode),
                          )
                        : SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_open),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        letter4 = true;
                      });
                      OneDialog.show(
                        context,
                        msg: '',
                        okText: 'Đóng',
                        title:
                            'Em sẽ vẫn luôn ở đây, luôn sẵn sàng lắng nghe tất cả những áp lực và rối ren buồn phiền của anh. Nếu có khó nói, hay chưa thể nói, anh có thể sắp xếp lại rồi nói với em nhé.❤️',
                        alertStyle: OneDialogAlertStyle.success,
                        okHandler: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: !letter4
                        ? SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_clode),
                          )
                        : SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(OneImages.letter_open),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buttonStart()
            ],
          ),
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
            return const HomeScreen();
          }));
        },
        child: const SizedBox(
          height: 65,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            color: OneColors.qrLine,
            child: Center(
              child: Text(
                '❤️ ❤️ ❤️',
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
}
