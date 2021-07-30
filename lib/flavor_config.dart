import 'package:leader_app/utils/string_utils.dart';

enum Flavor {
  DEV,
  QA,
  STG,
  PRODUCTION,
}

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
  });
  final String baseUrl;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig _instance = FlavorConfig(
    flavor: Flavor.DEV,
    values:
        FlavorValues(baseUrl: "http://222.252.17.214:7000/appLanhDao/api/v1"),
  );

  // factory FlavorConfig({
  //   required Flavor flavor,
  //   required FlavorValues values,
  // }) {
  //   _instance = FlavorConfig._internal(
  //       flavor, StringUtils.enumName(flavor.toString()), values);
  //   return _instance;
  // }
  //
  // FlavorConfig._internal(this.flavor, this.name, this.values);
  static FlavorConfig get instance {
    return _instance;
  }

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    return FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), values);
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isStaging() => _instance.flavor == Flavor.STG;
  static bool isQA() => _instance.flavor == Flavor.QA;
}
