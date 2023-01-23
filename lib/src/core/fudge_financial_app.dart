import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/env.dart';
import 'package:fudge_financial_app/src/config/router.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/injector/injector.dart';
import 'package:fudge_financial_app/src/domain/repositories/user_repo.dart';
import 'package:provider/provider.dart';

class FudgeFinancialApp extends StatelessWidget {
  const FudgeFinancialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppEnvironment>(create: (context) => injector()),
        Provider<UserRepository>(create: (context) => injector()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        theme: AppTheme.theme,
      ),
    );
  }
}
