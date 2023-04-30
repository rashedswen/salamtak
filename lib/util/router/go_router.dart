import 'package:go_router/go_router.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/view/add_donation_page.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/add_request.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/dashboard.dart';
import 'package:salamtak/util/router/screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    // redirect: (context, state) {
    //   return Screens.addRequest.route;
    // },
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: Screens.addRequest.route,
        name: Screens.addRequest.name,
        builder: (context, state) => const AddRequestPage(),
      ),
      GoRoute(
        name: Screens.addDonation.name,
        path: Screens.addDonation.route,
        builder: (context, state) {
          return const AddDonationPage();
        },
      ),
    ],
  );
}
