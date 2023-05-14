import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatefulWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileCubit>().getProviders();
  }

  @override
  Widget build(BuildContext context) {
    // print(context.read<AppBloc>().state.user);

    return Stack(
      children: [
        const SalamtakBackground(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SalamtakAppBar(),
                const SizedBox(height: 16),
                Text(
                  context.l10n.profile,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: lightGreen,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Stack(
                    children: [
                      Align(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipOval(
                            child: Image.network(
                              'https://th.bing.com/th/id/R.e0a64852803e842e1d8ad137d78f9af9?rik=NXUtesSo9SP6WA&pid=ImgRaw&r=0',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              lightGreen.withOpacity(0.8),
                            ),
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                          ),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
