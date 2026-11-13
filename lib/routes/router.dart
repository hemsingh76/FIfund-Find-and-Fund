import 'package:go_router/go_router.dart';

import '../pages/dashboard.dart';
import '../pages/loginPage.dart';
import '../pages/registerPage.dart';

//routes for the app
final GoRouter router = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/loginPage',
        builder: (context, state) => loginPage(),
      ),

      GoRoute(
        path: '/registerPage',
        builder : (context, state) => registerPage(),
      ),

      GoRoute(
          path:'/dashboard',
          builder: (context, state) => dashboard(),
      ),

    ]
);