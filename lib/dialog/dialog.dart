/*
 * File: one_dialog.dart
 * File Created: Tuesday, 6th April 2021 3:51:49 pm
 * Author: Tân Hà
 * -----
 * Last Modified: Monday, 19th June 2023 15:09:45 pm
 * Modified By: Anh Quan
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/color.dart';
import 'package:from_chang_chang_with_love/const/image.dart';
import 'package:from_chang_chang_with_love/const/theme.dart';
import 'package:lottie/lottie.dart';

enum OneDialogAlertStyle {
  none,
  success,
  failure,
}

class OneDialog extends StatefulWidget {
  const OneDialog(
      {Key? key,
      required this.id,
      this.alertStyle = OneDialogAlertStyle.none,
      this.title = 'Thông báo',
      this.msg,
      this.okText = 'Đóng',
      this.cancelText,
      this.okHandler,
      this.cancelHandler,
      this.closeHandler,
      this.content,
      this.titleTextAlign = TextAlign.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.msgTextAlign = TextAlign.center,
      this.barrierDismissible = false,
      this.okBtnAutoPopWhenOnTap = true,
      this.cancelBtnAutoPopWhenOnTap = true,
      this.isBtnCanclePrimary = false,
      this.isShowBottomSheet,
      this.alertIcon,
      this.titleStyle,
      this.messageStyle,
      this.cancelTextStyle,
      this.cancelBgColor,
      this.cancelColor,
      this.enableDrag = false})
      : super(key: key);

  final OneDialogAlertStyle alertStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String? msg;
  final String okText;
  final String? cancelText;
  final VoidCallback? okHandler;
  final VoidCallback? cancelHandler;
  final VoidCallback? closeHandler;
  final Widget? content;
  final TextAlign titleTextAlign;
  final TextAlign msgTextAlign;
  final bool barrierDismissible;
  final bool okBtnAutoPopWhenOnTap;
  final bool cancelBtnAutoPopWhenOnTap;
  final bool isBtnCanclePrimary;
  final bool? isShowBottomSheet;
  final String? alertIcon;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final TextStyle? cancelTextStyle;
  final Color? cancelBgColor;
  final Color? cancelColor;
  final bool? enableDrag;
  final int id;

  @override
  _OneDialogState createState() => _OneDialogState();

  static Future<void> show(
    BuildContext context, {
    OneDialogAlertStyle alertStyle = OneDialogAlertStyle.none,
    String title = 'Thông báo',
    String? msg,
    String okText = 'Đóng',
    String? cancelText,
    VoidCallback? okHandler,
    VoidCallback? cancelHandler,
    VoidCallback? closeHandler,
    Widget? content,
    TextAlign titleTextAlign = TextAlign.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextAlign msgTextAlign = TextAlign.center,
    bool barrierDismissible = false,
    bool okBtnAutoPopWhenOnTap = true,
    bool cancelBtnAutoPopWhenOnTap = true,
    bool isBtnCanclePrimary = false,
    bool isShowBottomSheet = true,
    bool enableDrag = false,
    String? alertIcon,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    TextStyle? cancelTextStyle,
    Color? cancelBgColor,
    Color? cancelColor,
    int id = 0,
  }) {
    {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return OneDialog(
            alertStyle: alertStyle,
            title: title,
            msg: msg,
            okText: okText,
            cancelText: cancelText,
            okHandler: okHandler,
            cancelHandler: cancelHandler,
            closeHandler: closeHandler,
            content: content,
            titleTextAlign: titleTextAlign,
            crossAxisAlignment: crossAxisAlignment,
            msgTextAlign: msgTextAlign,
            barrierDismissible: barrierDismissible,
            okBtnAutoPopWhenOnTap: okBtnAutoPopWhenOnTap,
            cancelBtnAutoPopWhenOnTap: cancelBtnAutoPopWhenOnTap,
            alertIcon: alertIcon,
            cancelTextStyle: cancelTextStyle,
            cancelBgColor: cancelBgColor,
            cancelColor: cancelColor,
            id: id,
          );
        },
      );
    }
  }
}

class _OneDialogState extends State<OneDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(widget.barrierDismissible),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        alignment: widget.isShowBottomSheet == true ? Alignment.bottomCenter : Alignment.center,
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: OneColors.bHC.withOpacity(0.8),
          ),
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return OrientationBuilder(builder: (_, orientation) {
                    return Container(
                      constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.8),
                      margin: const EdgeInsets.only(top: 8, bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: widget.crossAxisAlignment,
                                  children: [
                                    _buildAlertImg(context, widget.alertIcon),
                                    widget.isShowBottomSheet == true ? const SizedBox() : _buildTitle(context),
                                    const SizedBox(height: 5),
                                    _buildBody(),
                                    const SizedBox(height: 10),
                                    _buildButton(context),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        height: 60,
        width: 200,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          color: OneColors.yellowLight,
          child: Center(
            child: Text(
              widget.okText,
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlertImg(context, String? alertIcon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
      child: Center(
          child: widget.id == 0
              ? Lottie.asset(
                  "assets/loading.json",
                  width: 200,
                  height: 200,
                  repeat: true,
                  fit: BoxFit.contain,
                )
              : _buildImage()),
    );
  }

  Widget _buildTitle(context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
        bottom: 12,
      ),
      child: SelectableText(
        widget.title,
        style: widget.titleStyle ?? OneTheme.of(context).header,
        textAlign: widget.titleTextAlign,
      ),
    );
  }

  Widget _buildBody() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.msg != null)
              SelectableText(
                widget.msg!,
                style: widget.messageStyle ?? OneTheme.of(context).body1.copyWith(color: OneColors.textGrey2, fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: widget.msgTextAlign,
              ),
            widget.content ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Image _buildImage() {
    switch (widget.id) {
      case 1:
        return Image.asset(OneImages.anh1);
      case 2:
        return Image.asset(OneImages.anh2);
      case 3:
        return Image.asset(OneImages.anh3);
      case 4:
        return Image.asset(OneImages.anh4);
      default:
        return Image.asset(OneImages.anh1);
    }
  }
}
