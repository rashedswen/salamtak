import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login/widgets/salamtal_login_button.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SalamtakBackground(
          isDashboard: false,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (Theme.of(context).brightness == Brightness.dark)
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            child: Image.asset(
                              'assets/images/logo_transparent.png',
                              height: 150,
                            ),
                          )
                        else
                          Image.asset(
                            'assets/images/logo_transparent.png',
                            height: 150,
                          ),
                        // const SignInWithEmailForm(),
                        const SizedBox(height: 72),
                        Text(
                          context.l10n.welcome,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.login_to_continue,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 64),

                        SalamtalLoginButton(
                          text: context.l10n.continue_with_phone_number,
                          icon: FontAwesomeIcons.phone,
                          onPressed: () {
                            context
                                .pushNamed(Screens.loginWithPhoneNumber.name);
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.l10n.or,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SalamtalLoginButton(
                          text: context.l10n.continue_with_twitter,
                          icon: FontAwesomeIcons.twitter,
                          onPressed: () {
                            context.read<LoginCubit>().logInWithTwitter();
                          },
                        ),
                        const SizedBox(height: 16),
                        if (defaultTargetPlatform == TargetPlatform.iOS)
                          SalamtalLoginButton(
                            text: context.l10n.continue_with_apple,
                            icon: FontAwesomeIcons.apple,
                            onPressed: () {
                              context.read<LoginCubit>().logInWithApple();
                            },
                          ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
