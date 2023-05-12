import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/util/constants.dart';

class SalamtakAppBar extends StatelessWidget {
  const SalamtakAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            FontAwesomeIcons.barsStaggered,
            color: lightGreen,
            size: 24,
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/logo_transparent.png',
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}

Widget salamtakAppBarMeth(BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          FontAwesomeIcons.barsStaggered,
          color: lightGreen,
          size: 24,
        ),
      ),
      const Spacer(),
      Image.asset(
        'assets/images/logo_transparent.png',
        width: 50,
        height: 50,
      ),
    ],
  );
}
