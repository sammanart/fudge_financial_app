import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fudge_financial_app/src/config/enums.dart';

class AppEnvironment {
  AppEnvironment._();
  static const _keyApiHttpUrl = 'API_ROOT';

  String get apiHttpUrl => _getOrDefault(_keyApiHttpUrl);

  String _getOrDefault(String key) {
    final envValue = dotenv.env[key];
    if (envValue != null && envValue.trim().isNotEmpty) {
      return envValue;
    }

    throw Exception('undefined config: $key');
  }

  static bool _isEveryDefined() {
    final envKeys = <String>[
      // URL's
      ...[
        _keyApiHttpUrl,
      ],
    ];

    return dotenv.isEveryDefined(envKeys);
  }

  static Future<AppEnvironment> instance(Environment env) async {
    final envFile = '.env.${env.toString().split('.').last.toLowerCase()}';
    try {
      await dotenv.load(fileName: envFile);
    } catch (_) {}
    if (!_isEveryDefined()) {
      throw UnimplementedError(
        'please add missing configrations on $envFile file',
      );
    }

    return AppEnvironment._();
  }
}
