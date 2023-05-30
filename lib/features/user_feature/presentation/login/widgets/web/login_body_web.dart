import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/shared_image_container.dart';
import 'package:salamtak/features/user_feature/presentation/login/widgets/login_body_shared.dart';

class LoginWebBody extends StatelessWidget {
  const LoginWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SalamtakBackground(
          isDashboard: false,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 128),
          child: Center(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: LoginBodyShared(),
                  ),
                  Expanded(
                    child: SharedImageContainer(),
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
