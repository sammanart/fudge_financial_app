import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/config/enums.dart';
import 'package:fudge_financial_app/src/config/env.dart';
import 'package:fudge_financial_app/src/core/fudge_financial_app.dart';
import 'src/core/injector/injector.dart' as service_locator;

Future<void> main() async {
  
  // Init Service locator
  final env = await AppEnvironment.instance(Environment.development);
  await service_locator.call(env);
  await service_locator.injector.allReady();

  runApp(const FudgeFinancialApp());
}
