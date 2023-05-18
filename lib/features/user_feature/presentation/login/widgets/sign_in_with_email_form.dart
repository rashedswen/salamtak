import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/divider.dart';
import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:formz/formz.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/login_cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class SignInWithEmailForm extends StatelessWidget {
  const SignInWithEmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.email != current.email,
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
                    ? () => context.read<LoginCubit>().logInWithCredentials()
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
          Divider(
            height: 40,
            thickness: 1,
            color: Colors.grey.shade400,
          ),
          // login with twitter
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.status.isInProgress
                    ? null
                    : () {
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
                    if (state.status.isInProgress)
                      const CircularProgressIndicator.adaptive()
                    else
                      Text(
                        context.l10n.continue_with_twitter,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
