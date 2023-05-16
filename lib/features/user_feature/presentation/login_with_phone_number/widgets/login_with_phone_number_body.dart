import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/layout/dimensions.dart';

class LoginWithPhoneNumberBody extends StatefulWidget {
  const LoginWithPhoneNumberBody({super.key});

  @override
  State<LoginWithPhoneNumberBody> createState() =>
      _LoginWithPhoneNumberBodyState();
}

class _LoginWithPhoneNumberBodyState extends State<LoginWithPhoneNumberBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginWithPhoneNumberCubit, LoginWithPhoneNumberState>(
      builder: (context, state) {
        return Stack(
          children: [
            const SalamtakBackground(
              isDashboard: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.submitStatus ==
                                  LoginWithPhoneNumberSubmitStatus.otpSent)
                                const SizedBox(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/otp_phone.png',
                                    ),
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Text(
                                context.l10n.signup_with_phone_number,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 48),
                              BlocBuilder<LoginWithPhoneNumberCubit,
                                  LoginWithPhoneNumberState>(
                                builder: (context, state) {
                                  if (state.submitStatus !=
                                      LoginWithPhoneNumberSubmitStatus
                                          .otpSent) {
                                    return Column(
                                      children: [
                                        PhysicalModel(
                                          color: Colors.transparent,
                                          elevation: 3,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: TextFormField(
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textDirection: TextDirection.ltr,
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                hintText: '249 123 456 789',
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.all(8),
                                              ),
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        LoginWithPhoneNumberCubit>()
                                                    .phoneNumberChanged(value);
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        SalamtakButton(
                                          text: context.l10n.sent_otp,
                                          onTap: () {
                                            context
                                                .read<
                                                    LoginWithPhoneNumberCubit>()
                                                .loginWithPhoneNumber();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  // otp 6 digits text fields auto focus change
                                  return Column(
                                    children: [
                                      // show phone image animated

                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0; i < 6; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                ),
                                                child: SizedBox(
                                                  width: 48,
                                                  child: PhysicalModel(
                                                    color: Colors.transparent,
                                                    elevation: 3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      16,
                                                    ),
                                                    child: TextFormField(
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                          1,
                                                        ),
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      textAlign:
                                                          TextAlign.center,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            16,
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(
                                                          8,
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        if (value.length == 1 &&
                                                            i != 5) {
                                                          FocusScope.of(context)
                                                              .nextFocus();
                                                        }
                                                        context
                                                            .read<
                                                                LoginWithPhoneNumberCubit>()
                                                            .otpChanged(
                                                              value,
                                                              i,
                                                            );
                                                        if (i == 5) {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          context
                                                              .read<
                                                                  LoginWithPhoneNumberCubit>()
                                                              .verifyOtp();
                                                        }
                                                      },
                                                      autofocus: i == 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SalamtakButton(
                                        text: context.l10n.login,
                                        onTap: () {
                                          context
                                              .read<LoginWithPhoneNumberCubit>()
                                              .verifyOtp();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (MediaQuery.of(context).size.width > tabletWidth)
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/login_logo.png'),
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
      },
    );
  }
}
