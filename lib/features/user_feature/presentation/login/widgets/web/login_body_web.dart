import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login/widgets/salamtal_login_button.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class LoginWebBody extends StatelessWidget {
  const LoginWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SalamtakBackground(
          isDashboard: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 128),
          child: Center(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            context
                                .pushNamed(Screens.loginWithPhoneNumber.name);
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
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () {
                            context.read<LoginCubit>().logInAnonymously();
                          },
                          child: Text(context.l10n.login_as_guest),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
