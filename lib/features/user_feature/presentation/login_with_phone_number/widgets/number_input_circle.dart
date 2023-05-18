import 'package:flutter/material.dart';

class NumberInputCircle extends StatelessWidget {
  const NumberInputCircle({
    super.key,
    required this.number,
    required this.onTap,
  });

  final int number;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: InkWell(
        onTap: () {
          onTap(number);
        },
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
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
