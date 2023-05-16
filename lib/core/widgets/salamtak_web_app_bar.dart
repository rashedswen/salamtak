import 'package:flutter/src/material/text_button.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter/src/widgets/spacer.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/router/screen.dart';

class SalamtakWebAppBar extends StatelessWidget {
  const SalamtakWebAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo_transparent.png',
          width: 80,
          height: 80,
        ),
        // const SizedBox(
        //   width: 16,
        // ),
        // const SizedBox(
        //   width: 500,
        //   child: SalamtakSearchBar(),
        // ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(
              Screens.privacyPolicy.name,
            );
          },
          child: Text(
            context.l10n.privacy_policy,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: lightGreen,
                ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        TextButton(
          onPressed: () {
            context.read<AppBloc>().add(AppLogoutRequested());
            context.pushNamed(
              Screens.login.name,
            );
          },
          child: Text(
            context.l10n.logout,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: lightGreen,
                ),
          ),
        )
      ],
    );
  }
}
