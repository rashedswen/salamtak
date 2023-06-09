import 'package:flutter/material.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/profile_tab_view.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/layout/dimensions.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with TickerProviderStateMixin {
  late TabController tabViewController;
  @override
  void initState() {
    tabViewController = TabController(length: 2, vsync: this);
    super.initState();
    context.read<ProfileCubit>().getProviders();
    context.read<ProfileCubit>().getUserRequests();
  }

  @override
  Widget build(BuildContext context) {
    return context.read<AppBloc>().state.status == AppStatus.authenticated
        ? Stack(
            children: [
              if (MediaQuery.of(context).size.width < tabletWidth)
                const SalamtakBackground(),
              SafeArea(
                child: Padding(
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
                                if (MediaQuery.of(context).size.width <
                                    tabletWidth)
                                  const SalamtakAppBar(),
                                const SizedBox(height: 16),
                                Text(
                                  context.l10n.profile,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
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
                                        child: BlocBuilder<AppBloc, AppState>(
                                          builder: (context, state) {
                                            if (state.user.photoUrl == null) {
                                              return SizedBox(
                                                height: 120,
                                                width: 120,
                                                child: ClipOval(
                                                  child: Icon(
                                                    Icons.person_rounded,
                                                    size: 120,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface,
                                                  ),
                                                ),
                                              );
                                            }
                                            return SizedBox(
                                              height: 120,
                                              width: 120,
                                              child: ClipOval(
                                                child: Image.network(
                                                  state.user.photoUrl!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      // Positioned(
                                      //   right: 0,
                                      //   bottom: 0,
                                      //   child: IconButton(
                                      //     onPressed: () {},
                                      //     style: ButtonStyle(
                                      //       backgroundColor:
                                      //           MaterialStateProperty.all(
                                      //         lightGreen.withOpacity(0.8),
                                      //       ),
                                      //       shape: MaterialStateProperty.all(
                                      //         const CircleBorder(),
                                      //       ),
                                      //     ),
                                      //     icon: const Icon(
                                      //       Icons.camera_alt,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                BlocBuilder<AppBloc, AppState>(
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        Text(
                                          state.user.phoneNumber ?? '',
                                          textDirection: TextDirection.ltr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                const ProfileTabView(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        : const LoginToContinueWidget();
  }
}
