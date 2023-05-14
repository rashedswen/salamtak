import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/widgets/my_number_keyboard.dart';

class LoginWithPhoneNumberBody extends StatelessWidget {
  const LoginWithPhoneNumberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginWithPhoneNumberCubit, LoginWithPhoneNumberState>(
      builder: (context, state) {
        return Stack(
          children: [
            const SalamtakBackground(
              isDashboard: false,
            ),
            SafeArea(
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const SignInWithPhoneNumberForm(),
                    const Spacer(
                      flex: 3,
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox.expand(
                        child: Card(
                          color: Colors.white,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  child: Text(
                                    'Enter your phone number',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        if (state.submitStatus ==
                                            LoginWithPhoneNumberSubmitStatus
                                                .success)
                                          Row(
                                            children: [
                                              // 6 digits 6 fields
                                              for (var i = 0; i < 6; i++)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Container(
                                                    width: 24,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        4,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        state.otp.length > i
                                                            ? state.otp[i]
                                                            : '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          )
                                        else
                                          Text(
                                            state.phoneNumber.isEmpty
                                                ? '249xxxxxxxxx'
                                                : state.phoneNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                  color:
                                                      state.phoneNumber.isEmpty
                                                          ? Colors.grey
                                                          : Colors.black,
                                                ),
                                          ),
                                        const Spacer(),
                                        if (state.phoneNumber.isNotEmpty)
                                          IconButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      LoginWithPhoneNumberCubit>()
                                                  .numberDeleted();
                                            },
                                            icon: const Icon(
                                              Icons.backspace,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        if (state.otp.isNotEmpty)
                                          IconButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      LoginWithPhoneNumberCubit>()
                                                  .otpDeleted();
                                            },
                                            icon: const Icon(
                                              Icons.backspace,
                                              color: Colors.grey,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: MyNumberKeyboard(
                                    onTap: (number) {
                                      if (state.submitStatus ==
                                          LoginWithPhoneNumberSubmitStatus
                                              .success) {
                                        context
                                            .read<LoginWithPhoneNumberCubit>()
                                            .otpChanged(number.toString());
                                      } else {
                                        context
                                            .read<LoginWithPhoneNumberCubit>()
                                            .numberAdded(number.toString());
                                      }
                                    },
                                    onSubmit: () {
                                      if (state.submitStatus ==
                                          LoginWithPhoneNumberSubmitStatus
                                              .success) {
                                        context
                                            .read<LoginWithPhoneNumberCubit>()
                                            .verifyOtp();
                                      } else {
                                        context
                                            .read<LoginWithPhoneNumberCubit>()
                                            .loginWithPhoneNumber();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
