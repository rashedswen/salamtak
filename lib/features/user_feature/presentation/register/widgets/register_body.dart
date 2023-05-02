import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/city_selector.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) =>
                        previous.name != current.name,
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
                  BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
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
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.city,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return CitySelector(
                              onTap: (location) {
                                context.read<RegisterCubit>().locationChanged(
                                      location,
                                    );
                              },
                              selectedLocation: state.location,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        buildWhen: (previous, current) =>
                            previous.address != current.address,
                        builder: (context, state) {
                          return TextWithField(
                            text: context.l10n.address,
                            onChanged: (value) {
                              context
                                  .read<RegisterCubit>()
                                  .addressChanged(value);
                            },
                          );
                        },
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        buildWhen: (previous, current) =>
                            previous.phoneNumber != current.phoneNumber,
                        builder: (context, state) {
                          return TextWithField(
                            text: context.l10n.phone,
                            onChanged: (value) {
                              context
                                  .read<RegisterCubit>()
                                  .phoneNumberChanged(value);
                            },
                            errorText: state.phoneNumber.displayError?.name,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => current.isValid,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.isValid
                            ? () => context
                                .read<RegisterCubit>()
                                .signUpWithCredentials()
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
            ),
          ],
        ),
      ),
    );
  }
}
