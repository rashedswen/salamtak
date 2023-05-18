import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/ink_well.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/spacer.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/widgets/number_input_circle.dart';
import 'package:salamtak/util/constants.dart';

class MyNumberKeyboard extends StatelessWidget {
  const MyNumberKeyboard({
    super.key,
    required this.onTap,
    required this.onSubmit,
  });

  final void Function(int number) onTap;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberInputCircle(
                number: 1,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 2,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 3,
                onTap: onTap,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberInputCircle(
                number: 4,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 5,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 6,
                onTap: onTap,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberInputCircle(
                number: 7,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 8,
                onTap: onTap,
              ),
              NumberInputCircle(
                number: 9,
                onTap: onTap,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 72,
                height: 72,
              ),
              NumberInputCircle(
                number: 0,
                onTap: onTap,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: InkWell(
                  onTap: onSubmit,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Icon(
                          Icons.check,
                          color: darkGreen,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
