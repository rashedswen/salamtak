import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/register/widgets/register_body_shared.dart';
import 'package:salamtak/l10n/l10n.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SalamtakBackground(),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SalamtakAppBar(),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        context.l10n.signup,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const RegisterBodyShared(),
                    ],
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
