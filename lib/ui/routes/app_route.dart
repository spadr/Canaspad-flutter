import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/init/init_page.dart';
import 'package:canaspad/ui/routes/route_path.dart';

//import 'package:canaspad/ui/xxx/xxx_page.dart';
//import 'package:canaspad/ui/auth/auth_page.dart';
//import 'package:canaspad/ui/tube/tube_page.dart';
//import 'package:canaspad/ui/element/element_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteInit,
      page: InitPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
