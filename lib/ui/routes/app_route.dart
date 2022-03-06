import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/auth/auth_page.dart';
//import 'package:canaspad/ui/auth/login_page.dart';
import 'package:canaspad/ui/init/init_page.dart';
import 'package:canaspad/ui/init/init_page_control.dart';
import 'package:canaspad/ui/init/init_page_latest.dart';
import 'package:canaspad/ui/init/init_page_setting.dart';
import 'package:canaspad/ui/routes/route_path.dart';

//import 'package:canaspad/ui/xxx/xxx_page.dart';
//import 'package:canaspad/ui/tube/tube_page.dart';
//import 'package:canaspad/ui/element/element_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RoutePath.appRouteInit,
      page: InitPage,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteAuth,
      page: AuthPage,
    ),
    AutoRoute(
      path: RoutePath.appRouteControl,
      page: InitControlPage,
    ),
    AutoRoute(
      path: RoutePath.appRouteLatest,
      page: InitLatestPage,
    ),
    AutoRoute(
      path: RoutePath.appRouteSetting,
      page: InitSettingPage,
    ),
  ],
)
class $AppRouter {}
