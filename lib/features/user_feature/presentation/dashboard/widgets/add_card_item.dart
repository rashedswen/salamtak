import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/util/constants.dart';

class AddCardItem extends StatelessWidget {
  const AddCardItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isVertical = true,
  });

  final IconData icon;
  final String text;
  final void Function() onTap;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              darkGreen,
              lightGreen,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 22,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FaIcon(
              icon,
              size: isVertical ? 90 : 50,
              color: const Color(0xFFFFFFFF),
            ),
            FittedBox(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color(0xffffffff),
                      letterSpacing: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowAddCard extends StatelessWidget {
  const RowAddCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.isVertical = true,
  });

  final IconData icon;
  final String text;
  final void Function() onTap;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: salamtakShadow,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF095D7E),
              Color(0xFF14967F),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FaIcon(
                icon,
                color: const Color(0xFFFFFFFF),
                size: 50,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xffffffff),
                        letterSpacing: 1.5,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
