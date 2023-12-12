import 'package:let_him_cook/utils/constants.dart';

class DevelopmentConstant {
  static const String APP_NAME = '[D] $appName';
  static const String API_ENDPOINT = ''; // TODO: Setup endpoint here
  static const EnvironmentType ENVIRONMENT_TYPE = EnvironmentType.DEVELOPMENT;
}

class StagingConstant {
  static const String APP_NAME = '[S] $appName';
  static const String API_ENDPOINT = ''; // TODO: Setup endpoint here
  static const EnvironmentType ENVIRONMENT_TYPE = EnvironmentType.STAGING;
}

class ProductionConstant {
  static const String APP_NAME = '$appName';
  static const String API_ENDPOINT = ''; // TODO: Setup endpoint here
  static const EnvironmentType ENVIRONMENT_TYPE = EnvironmentType.PRODUCTION;
}

/// Define the type of environment supported in this project
enum EnvironmentType { PRODUCTION, STAGING, DEVELOPMENT }
