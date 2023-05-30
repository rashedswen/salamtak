import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_web_app_bar.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/layout/dimensions.dart';
import 'package:salamtak/util/router/screen.dart';

class SalamtakAppBar extends StatelessWidget {
  const SalamtakAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > tabletWidth
        ? const SalamtakWebAppBar()
        : const SalamtakMobileAppBar();
  }
}

class SalamtakMobileAppBar extends StatelessWidget {
  const SalamtakMobileAppBar({
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
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            context.pushNamed(
              Screens.dashboard.name,
            );
          },
          child: Theme.of(context).brightness == Brightness.light
              ? Image.asset(
                  'assets/images/logo_transparent.png',
                  width: 50,
                  height: 50,
                )
              : ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/images/logo_transparent.png',
                    width: 50,
                    height: 50,
                  ),
                ),
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
      InkWell(
        onTap: () {
          context.pushNamed(
            Screens.dashboard.name,
          );
        },
        child: Image.asset(
          'assets/images/logo_transparent.png',
          width: 50,
          height: 50,
        ),
      ),
    ],
  );
}
