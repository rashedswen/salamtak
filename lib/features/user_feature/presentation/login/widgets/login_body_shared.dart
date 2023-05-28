import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/platform.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/login_cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login/widgets/salamtal_login_button.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class LoginBodyShared extends StatelessWidget {
  const LoginBodyShared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TextWithField(
              text: context.l10n.email,
              onChanged: (value) {
                context.read<LoginCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.emailfounded != current.emailfounded,
              builder: (context, state) {
                if (state.emailfounded == Emailfounded.found) {
                  return Column(
                    children: [
                      TextWithField(
                        text: context.l10n.password,
                        onChanged: (value) {
                          context.read<LoginCubit>().passwordChanged(value);
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            // TextWithField(
            //   text: context.l10n.password,
            //   onChanged: (value) {
            //     context
            //         .read<LoginCubit>()
            //         .passwordChanged(value);
            //   },
            // ),
            // const SizedBox(height: 16),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state.emailfounded == Emailfounded.found) {
                  return SalamtakButton(
                    onTap: state.status == FormzSubmissionStatus.inProgress
                        ? null
                        : () {
                            context.read<LoginCubit>().logInWithCredentials();
                          },
                    text: context.l10n.login,
                  );
                }
                return SalamtakButton(
                  onTap: state.emailfounded == Emailfounded.loading
                      ? null
                      : () {
                          context.read<LoginCubit>().checkIfUserExist();
                        },
                  text: context.l10n.continuez,
                );
              },
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(Screens.register.name);
              },
              child: Text(context.l10n.signup),
            ),
          ],
        ),
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
    );
  }
}
