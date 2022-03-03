import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/auth/auth_page.dart';
import 'package:canaspad/ui/routes/route_path.dart';
//import 'package:canaspad/ui/xxx/xxx_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteAuth,
      page: AuthPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
