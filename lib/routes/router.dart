import 'package:go_router/go_router.dart';

import '../pages/loginPage.dart';
import '../pages/registerPage.dart';

final GoRouter router = GoRouter(
    initialLocation: '/loginPage',
    routes: [
      GoRoute(
        path: '/loginPage',
        builder: (context, state) => loginPage(),
      ),

      GoRoute(
        path: '/registerPage',
        builder : (context, state) => registerPage(),
      ),
    ]
);