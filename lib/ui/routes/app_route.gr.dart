// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:canaspad/ui/tube/tube_page.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    TubeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.TubePage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/tube', fullMatch: true),
        _i2.RouteConfig(TubeRoute.name, path: '/tube')
      ];
}

/// generated route for
/// [_i1.TubePage]
class TubeRoute extends _i2.PageRouteInfo<void> {
  const TubeRoute() : super(TubeRoute.name, path: '/tube');

  static const String name = 'TubeRoute';
}
