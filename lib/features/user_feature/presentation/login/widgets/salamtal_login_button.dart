import 'dart:ui';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/src/painting/box_decoration.dart';
import 'package:flutter/src/painting/gradient.dart';
import 'package:flutter/src/painting/rounded_rectangle_border.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:salamtak/util/constants.dart';

class SalamtalLoginButton extends StatelessWidget {
  const SalamtalLoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF14967F),
        gradient: LinearGradient(
          colors: [
            lightGreen,
            darkGreen,
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
