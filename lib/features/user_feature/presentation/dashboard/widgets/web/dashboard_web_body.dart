import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_web_app_bar.dart';
import 'package:salamtak/core/widgets/web_widgets/web_add_item_row.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/list_of_items_section.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/profile_body.dart';
import 'package:salamtak/util/constants.dart';



class DashboardWebBody extends StatefulWidget {

  const DashboardWebBody({super.key});

  @override
  State<DashboardWebBody> createState() => _DashboardWebBodyState();
}

class _DashboardWebBodyState extends State<DashboardWebBody> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/login_background_dark.png'
              : 'assets/images/dashboard_web.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constrain) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isExpanded)
                    Container(
                      width: 350,
                      color: lemon,
                      child: const ProfileBody(),
                    ),
                  SizedBox(
                    width: isExpanded
                        ? constrain.maxWidth - 350
                        : constrain.maxWidth,
                    child: SingleChildScrollView(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: isExpanded
                              ? const EdgeInsetsDirectional.only(
                                  start: 32,
                                  end: 128,
                                )
                              : const EdgeInsets.symmetric(horizontal: 128),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80,
                                child: SalamtakWebAppBar(
                                  onSidebarTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              const WebAddItemRow(),
                              const SizedBox(height: 16),
                              const Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: ListOfItemsSection(),
                                  ),
                                ),
                              )
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
        ),
      ],
    );
  }
}
