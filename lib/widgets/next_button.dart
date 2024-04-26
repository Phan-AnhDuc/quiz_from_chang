import 'package:flutter/material.dart';
import 'package:from_chang_chang_with_love/const/color.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 70,
        width: 200,
        child: onPressed != null
            ? Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: OneColors.yellowLight,
                child: const Center(
                  child: Text(
                    'Tiếp tục',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
