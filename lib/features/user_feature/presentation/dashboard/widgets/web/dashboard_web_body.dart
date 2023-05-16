import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_web_app_bar.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/add_card_item.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/list_of_items_section.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/profile_body.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/router/screen.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardWebBody extends StatelessWidget {
  /// {@macro dashboard_body}
  const DashboardWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dashboard_web.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constrain) {
              print(constrain.maxWidth);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 350,
                    color: lemon,
                    child: const ProfileBody(),
                  ),
                  SizedBox(
                    width: constrain.maxWidth - 400,
                    child: SingleChildScrollView(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 128),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 80,
                                child: SalamtakWebAppBar(),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 210,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: AddCardItem(
                                        icon: FontAwesomeIcons.handHoldingHeart,
                                        text: context.l10n.donation,
                                        onTap: () {
                                          context.pushNamed(
                                            Screens.addDonation.name,
                                          );
                                        },
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 300,
                                    //   child: AddCardItem(
                                    //     icon: FontAwesomeIcons
                                    //         .arrowRightArrowLeft,
                                    //     text: 'تبادل',
                                    //     isVertical: false,
                                    //     onTap: () {},
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 300,
                                      child: AddCardItem(
                                        icon: FontAwesomeIcons.capsules,
                                        text: context.l10n.request,
                                        onTap: () {
                                          context.pushNamed(
                                            Screens.addRequest.name,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    context.l10n.recent_requests_and_donations,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      context.pushNamed(
                                        Screens.requestsAndDonationslist.name,
                                      );
                                    },
                                    icon: const Icon(
                                      FontAwesomeIcons.sliders,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                              const ListOfItemsSection()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
