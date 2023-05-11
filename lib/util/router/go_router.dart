import 'package:go_router/go_router.dart';
import '../../app/bloc/app_bloc.dart';
import '../../features/admin_feature/presentation/accept_requests_donations/view/accept_requests_donations_page.dart';
import '../../features/medication_feature/domain/entity/medication_list.dart';
import '../../features/medication_feature/presentation/add_donation/view/add_donation_page.dart';
import '../../features/medication_feature/presentation/add_request/add_request.dart';
import '../../features/medication_feature/presentation/medication_details/medication_details.dart';
import '../../features/medication_feature/presentation/requests_donations_list/requests_donations_list.dart';
import '../../features/medication_feature/presentation/user_requests_history/user_requests_history.dart';
import '../../features/user_feature/presentation/dashboard/dashboard.dart';
import '../../features/user_feature/presentation/login/view/login_page.dart';
import '../../features/user_feature/presentation/profile/view/profile_page.dart';
import '../../features/user_feature/presentation/register/view/register_page.dart';
import 'screen.dart';

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
        name: Screens.requestsAndDonationslist.name,
        path: Screens.requestsAndDonationslist.route,
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
      GoRoute(
        name: Screens.approveMedicationsRequests.name,
        path: Screens.approveMedicationsRequests.route,
        builder: (context, state) {
          return const AcceptRequestsDonationsPage();
        },
      ),
      GoRoute(
        name: Screens.medicationDetails.name,
        path: Screens.medicationDetails.route,
        builder: (context, state) {
          final medicationItem = state.extra! as MedicationItem;
          return MedicationDetailsPage(
            medicationItem: medicationItem,
          );
        },
      ),
      GoRoute(
        name: Screens.userHistory.name,
        path: Screens.userHistory.route,
        builder: (context, state) {
          return const UserRequestsHistoryPage();
        },
      ),
      GoRoute(
        name: Screens.profile.name,
        path: Screens.profile.route,
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
    ],
  );
}
