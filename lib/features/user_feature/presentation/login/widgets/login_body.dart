import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/text_with_field.dart';
import '../cubit/cubit.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../util/router/screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          BlocBuilder<LoginCubit, LoginState>(
                            buildWhen: (previous, current) =>
                                previous.email != current.email,
                            builder: (context, state) {
                              return TextWithField(
                                text: context.l10n.email,
                                onChanged: (value) => context
                                    .read<LoginCubit>()
                                    .emailChanged(value),
                                errorText: state.email.displayError?.name,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return TextWithField(
                                text: context.l10n.password,
                                onChanged: (value) => context
                                    .read<LoginCubit>()
                                    .passwordChanged(value),
                                obscureText: true,
                                errorText: state.password.displayError?.name,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<LoginCubit, LoginState>(
                            buildWhen: (previous, current) => current.isValid,
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: state.isValid
                                    ? () => context
                                        .read<LoginCubit>()
                                        .logInWithCredentials()
                                    : null,
                                child: state.status.isInProgress
                                    ? const CircularProgressIndicator()
                                    : Text(context.l10n.login),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () =>
                                context.pushNamed(Screens.register.name),
                            child: Text(context.l10n.signup),
                          ),
                          Divider(
                            height: 40,
                            thickness: 1,
                            color: Colors.grey.shade400,
                          ),
                          // login with twitter
                          ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().logInWithTwitter();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  context.l10n.continue_with_twitter,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
    );
  }
}
