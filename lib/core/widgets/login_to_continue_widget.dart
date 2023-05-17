import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class LoginToContinueWidget extends StatelessWidget {
  const LoginToContinueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(context.l10n.please_login_to_continue),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(Screens.login.name);
              },
              child: Text(context.l10n.login),
            ),
          ],
        ),
      );
  }
}
