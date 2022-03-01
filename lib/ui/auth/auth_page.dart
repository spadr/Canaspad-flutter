import 'package:canaspad/gen/assets.gen.dart';
import 'package:canaspad/ui/hooks/use_l10n.dart';
import 'package:canaspad/ui/theme/app_text_theme.dart';
import 'package:canaspad/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_view_model.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(authViewModelProvider);
    final viewModel = ref.watch(authViewModelProvider.notifier);
    final l10n = useL10n();

    return state.when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.flutterIcon.image(width: 200),
                  Text(
                    l10n.hello,
                    style: theme.textTheme.h70.bold(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.appColors.primary,
                      onPrimary: theme.appColors.onPrimary,
                    ),
                    onPressed: viewModel.revoke,
                    child: Text(data.token.toString()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              e.toString(),
              style: theme.textTheme.h30,
            ),
          ),
        ),
      ),
      loading: () => Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: theme.appColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
