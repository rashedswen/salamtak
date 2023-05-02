import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                      onChanged: (value) =>
                          context.read<LoginCubit>().emailChanged(value),
                      errorText: state.email.displayError?.name,
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextWithField(
                      text: context.l10n.password,
                      onChanged: (value) =>
                          context.read<LoginCubit>().passwordChanged(value),
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
                          ? () =>
                              context.read<LoginCubit>().logInWithCredentials()
                          : null,
                      child: state.status.isInProgress
                          ? const CircularProgressIndicator()
                          : Text(context.l10n.login),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => context.pushNamed(Screens.register.name),
                  child: Text(context.l10n.signup),
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => context.read<LoginCubit>().logInAnonymously(),
            child: Text(context.l10n.login_as_guest),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
