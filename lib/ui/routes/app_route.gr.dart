// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:canaspad/ui/auth/auth_page.dart' as _i2;
import 'package:canaspad/ui/init/init_page.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InitPage());
    },
    AuthRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.AuthPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i3.RouteConfig(InitRoute.name, path: '/init'),
        _i3.RouteConfig(AuthRoute.name, path: '/auth')
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i3.PageRouteInfo<void> {
  const InitRoute() : super(InitRoute.name, path: '/init');

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i3.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth');

  static const String name = 'AuthRoute';
}
