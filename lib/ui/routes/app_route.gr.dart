// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:canaspad/ui/auth/auth_page.dart' as _i2;
import 'package:canaspad/ui/init/init_page.dart' as _i1;
import 'package:canaspad/ui/init/init_page_control.dart' as _i3;
import 'package:canaspad/ui/init/init_page_latest.dart' as _i4;
import 'package:canaspad/ui/init/init_page_setting.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InitPage());
    },
    AuthRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.AuthPage());
    },
    InitControlRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.InitControlPage());
    },
    InitLatestRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.InitLatestPage());
    },
    InitSettingRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.InitSettingPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i6.RouteConfig(InitRoute.name, path: '/init'),
        _i6.RouteConfig(AuthRoute.name, path: '/auth'),
        _i6.RouteConfig(InitControlRoute.name, path: '/control'),
        _i6.RouteConfig(InitLatestRoute.name, path: '/latest'),
        _i6.RouteConfig(InitSettingRoute.name, path: '/setting')
      ];
}

/// generated route for
/// [_i1.InitPage]
class InitRoute extends _i6.PageRouteInfo<void> {
  const InitRoute() : super(InitRoute.name, path: '/init');

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.InitControlPage]
class InitControlRoute extends _i6.PageRouteInfo<void> {
  const InitControlRoute() : super(InitControlRoute.name, path: '/control');

  static const String name = 'InitControlRoute';
}

/// generated route for
/// [_i4.InitLatestPage]
class InitLatestRoute extends _i6.PageRouteInfo<void> {
  const InitLatestRoute() : super(InitLatestRoute.name, path: '/latest');

  static const String name = 'InitLatestRoute';
}

/// generated route for
/// [_i5.InitSettingPage]
class InitSettingRoute extends _i6.PageRouteInfo<void> {
  const InitSettingRoute() : super(InitSettingRoute.name, path: '/setting');

  static const String name = 'InitSettingRoute';
}
