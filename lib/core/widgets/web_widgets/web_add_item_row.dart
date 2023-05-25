import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/add_card_item.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class WebAddItemRow extends StatelessWidget {
  const WebAddItemRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          SizedBox(
            width: 300,
            child: AddCardItem(
              icon: FontAwesomeIcons.arrowRightArrowLeft,
              text: 'تبادل',
              isVertical: false,
              onTap: () {
                context.pushNamed(
                  Screens.addExchange.name,
                );
              },
            ),
          ),
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
    );
  }
}
