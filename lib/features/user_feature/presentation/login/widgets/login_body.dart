import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login/widgets/salamtal_login_button.dart';
import 'package:salamtak/l10n/l10n.dart';

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
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/images/logo_transparent.png',
                          height: 150,
                        ),
                        // const SignInWithEmailForm(),
                        const SizedBox(height: 72),
                        Text(
                          context.l10n.welcome,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.l10n.login_to_continue,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 64),
                        SalamtalLoginButton(
                          text: context.l10n.continue_with_phone_number,
                          icon: FontAwesomeIcons.phone,
                          onPressed: () {
                            context.read<LoginCubit>().logInWithGoogle();
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.l10n.or,
                          style: const TextStyle(
                            fontSize: 16,
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
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            context.read<LoginCubit>().logInAnonymously();
                          },
                          child: Text(context.l10n.login_as_guest),
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
