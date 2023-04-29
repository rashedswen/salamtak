import 'package:go_router/go_router.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/add_request.dart';
import 'package:salamtak/util/router/screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    redirect: (context, state) {
      return Screens.addRequest.route;
    },
    initialLocation: Screens.addRequest.route,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: Screens.addRequest.route,
        name: Screens.addRequest.name,
        builder: (context, state) => const AddRequestPage(),
      ),
      GoRoute(
        name: Screens.dashboard.name,
        path: Screens.dashboard.route,
        builder: (context, state) {
          return const AddRequestPage();
        },
      ),
    ],
  );
}
