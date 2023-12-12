import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/enum/app_enums.dart';
import 'package:let_him_cook/utils/services/base_services.dart';
import 'package:let_him_cook/utils/shared_preference_manager.dart';

Future<void> init(EnvironmentType type) async {
  WidgetsFlutterBinding.ensureInitialized();

  //Setting up sharedPreference instance
  await SharedPreferenceManager.getSharedPreference();

  // Setup hostURL for API call in services
  switch (type) {
    case EnvironmentType.PRODUCTION:
      {
        BaseServices.hostUrl = ProductionConstant.API_ENDPOINT;
      }
      break;
    case EnvironmentType.STAGING:
      {
        BaseServices.hostUrl = StagingConstant.API_ENDPOINT;
      }
      break;
    case EnvironmentType.DEVELOPMENT:
      {
        BaseServices.hostUrl = DevelopmentConstant.API_ENDPOINT;
      }
      break;
  }

  // Initialize Firebase Configurations
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform(type));

  // Pass all uncaught errors from the framework to Crashlytics.
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
}
