import 'package:flutter/material.dart';

import 'package:salamtak/util/layout/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.webBody,
  });

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget webBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else if (constraints.maxWidth < tabletWidth) {
          return tabletBody;
        } else {
          return webBody;
        }
      },
    );
  }
}
