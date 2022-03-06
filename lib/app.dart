import 'package:auto_route/auto_route.dart';
import 'package:canaspad/ui/auth/auth_view_model.dart';
import 'package:canaspad/ui/routes/app_route.gr.dart';
import 'package:canaspad/ui/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = useMemoized(() => AppRouter());
    final authModel = ref.watch(authViewModelProvider.notifier);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        theme: theme.data,
        darkTheme: AppTheme.dark().data,
        themeMode: themeMode,
        locale: DevicePreview.locale(context),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate.declarative(
          appRouter,
          routes: (_) => [
            if (authModel.isntLoggedIn())
              const AuthRoute()
            else
              const InitRoute()
          ],
        ),
        //routeInformationParser:appRouter.defaultRouteParser(includePrefixMatches: false)
      ),
    );
  }
}
