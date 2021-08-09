import 'package:leader_app/utils/string_utils.dart';

// review giúp em cái flavor như này xem có ổn không ạ. Ok rồi bác
enum Flavor {
  DEV,
  QA,
  STG,
  PRODUCTION,
}

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    required this.appVer,
  });
  final String baseUrl;
  final String appVer;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  FlavorConfig._(this.flavor, this.name, this.values);
  static FlavorConfig? get instance {
    return _instance;
  }

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance = FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;
  static bool isStaging() => _instance!.flavor == Flavor.STG;
  static bool isQA() => _instance!.flavor == Flavor.QA;
}
