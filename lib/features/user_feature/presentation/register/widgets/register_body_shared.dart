import 'package:flutter/src/material/elevated_button.dart';
import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:formz/formz.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/register_cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class RegisterBodyShared extends StatelessWidget {
  const RegisterBodyShared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => previous.name != current.name,
            builder: (context, state) {
              return TextWithField(
                text: context.l10n.name,
                onChanged: (value) {
                  context.read<RegisterCubit>().nameChanged(value);
                },
                errorText: state.name.displayError?.name,
              );
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextWithField(
                text: context.l10n.email,
                onChanged: (value) {
                  context.read<RegisterCubit>().emailChanged(value);
                },
                errorText: state.email.displayError?.name,
              );
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              return TextWithField(
                text: context.l10n.password,
                onChanged: (value) {
                  context.read<RegisterCubit>().passwordChanged(value);
                },
                errorText: state.password.displayError?.name,
                obscureText: true,
              );
            },
          ),
          // const SizedBox(height: 24),
          // LocationSection(
          //   onLocationChanged: (location) {
          //     context.read<RegisterCubit>().locationChanged(
          //           location,
          //         );
          //   },
          //   onAddressChanged: (value) {
          //     context
          //         .read<RegisterCubit>()
          //         .addressChanged(value);
          //   },
          //   selectedLocation:
          //       context.read<RegisterCubit>().state.location,
          //   selectedAddress: context
          //       .read<RegisterCubit>()
          //       .state
          //       .address
          //       .value,
          // ),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) =>
                previous.phoneNumber != current.phoneNumber,
            builder: (context, state) {
              return TextWithField(
                text: context.l10n.phone,
                hintText: '249xxxxxxxxx',
                onChanged: (value) {
                  context
                      .read<RegisterCubit>()
                      .phoneNumberChanged(value);
                },
                errorText:
                    state.phoneNumber.displayError?.name,
              );
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => current.isValid,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.isValid
                    ? () =>
                        context.read<RegisterCubit>().signUpWithCredentials()
                    : null,
                child: state.status.isInProgress
                    ? const CircularProgressIndicator()
                    : Text(context.l10n.signup),
              );
            },
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => context.pushNamed(Screens.login.name),
            child: Text(context.l10n.login),
          ),
        ],
      ),
    );
  }
}
