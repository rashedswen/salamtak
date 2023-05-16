import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/user_feature/presentation/profile/profile.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/profile_info_tab.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({
    super.key,
  });

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView>
    with TickerProviderStateMixin {
  late TabController tabViewController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabViewController = TabController(
      length: 2,
      vsync: this,
    );

    tabViewController.addListener(() {
      setState(() {
        _selectedIndex = tabViewController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredBox(
          color: const Color(0xFFD2EBC7),
          child: TabBar(
            controller: tabViewController,
            indicatorColor: const Color(0xFFD0EFE9),
            labelColor: darkGreen,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                child: FittedBox(
                  child: Text(
                    context.l10n.requests_status,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    context.l10n.settings,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: _selectedIndex == 0
              ? BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state.userRequests != null) {
                      if (state.userRequests!.isNotEmpty) {
                        return SingleChildScrollView(
                          child: Column(
                            children: state.userRequests!.map((request) {
                              return SizedBox(
                                height: 100,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 70,
                                      height: 70,
                                      alignment: Alignment.center,
                                      child: request.image != null
                                          ? Image.network(
                                              request.image!,
                                              fit: BoxFit.cover,
                                              width: 62,
                                              height: 62,
                                            )
                                          : FaIcon(request.form.icon, size: 40),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            request.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: darkGreen,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Row(
                                            children: [
                                              Chip(
                                                backgroundColor:
                                                    request.requestType.color,
                                                padding: EdgeInsets.zero,
                                                label: Text(
                                                  context.l10n.localeName ==
                                                          'ar'
                                                      ? request.requestType
                                                          .arabicName
                                                      : request.requestType
                                                          .englishName,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Chip(
                                                backgroundColor:
                                                    request.status.color,
                                                padding: EdgeInsets.zero,
                                                label: Text(
                                                  context.l10n
                                                              .localeName ==
                                                          'ar'
                                                      ? request
                                                          .status.arabicName
                                                      : request
                                                          .status.englishName,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      if (state.userRequests!.isEmpty) {
                        return Center(
                          child: Text(context.l10n.no_requests_found),
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              : const ProfileInfoTab(),
        )
      ],
    );
  }
}
