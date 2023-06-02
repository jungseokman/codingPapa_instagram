import 'package:go_router/go_router.dart';
import 'package:instagram/homepage.dart';
import 'package:instagram/screens/auth_screen.dart';
import 'package:instagram/screens/profile_screen.dart';

class TheRouter {
  late final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return HomePage();
        },
      ),
    ],
    initialLocation: '/',
    debugLogDiagnostics: true,
  );
}
