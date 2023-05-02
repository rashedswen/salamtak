import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/view/add_donation_page.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/add_request.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/requests_donations_list.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/dashboard.dart';
import 'package:salamtak/features/user_feature/presentation/login/view/login_page.dart';
import 'package:salamtak/features/user_feature/presentation/register/view/register_page.dart';
import 'package:salamtak/util/router/screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    redirect: (context, state) {
      final loggingIn = state.location == Screens.login.route;
      final registering = state.location == Screens.register.route;
      // final resetingPassword = state.location == Screens.resetPassword.route;
      final loggedIn =
          context.read<AppBloc>().state.status == AppStatus.authenticated;

      if (loggingIn && loggedIn) {
        return Screens.dashboard.route;
      }
      if (registering && loggedIn) {
        return Screens.dashboard.route;
      }
      if (!loggingIn && !registering && !loggedIn) {
        return Screens.login.route;
      }

      return null;
    },
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: Screens.dashboard.name,
        path: Screens.dashboard.route,
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
      GoRoute(
        name: Screens.medication.name,
        path: Screens.medication.route,
        builder: (context, state) {
          return const RequestsDonationsListPage();
        },
      ),
      GoRoute(
        name: Screens.login.name,
        path: Screens.login.route,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: Screens.register.name,
        path: Screens.register.route,
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
    ],
  );
}
