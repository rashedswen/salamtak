import 'package:flutter/material.dart';
import 'package:salamtak/l10n/l10n.dart';

class SalamtakBackground extends StatelessWidget {
  const SalamtakBackground({
    super.key,
    this.isDashboard = true,
  });

  final bool isDashboard;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isDashboard
          ? context.l10n.localeName == 'en'
              ? 'assets/images/dashboard_background_rtl.jpg'
              : 'assets/images/dashboard_background_ltr.jpg'
          : 'assets/images/login_background.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
