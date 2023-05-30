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
    final isRtl = context.l10n.localeName == 'ar';
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    print('isLightMode: ${Theme.of(context).brightness}}');
    return Image.asset(
      isDashboard
          ? isRtl
              ? isLightMode
                  ? 'assets/images/dashboard_background_ltr.jpg'
                  : 'assets/images/dashboard_background_dark_ltr.png'
              : isLightMode
                  ? 'assets/images/dashboard_background_rtl.jpg'
                  : 'assets/images/dashboard_background_dark_rtl.png'
          : isLightMode
              ? 'assets/images/login_background.jpg'
              : 'assets/images/login_background_dark.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
