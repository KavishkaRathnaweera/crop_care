import 'package:cropcare/Controllers/Bindings/StartScreenBind.dart';
import 'package:cropcare/Routes/UserTypeChecker.dart';
import 'package:cropcare/Screen/AppScreen/StartingScreen.dart';
import 'package:cropcare/Screen/AppScreen/UserRegScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'UserChecker.dart';

// root - userChecker
// roohHome - userTypeChecker

class AppRouter {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(
          name: "/",
          page: () => const StartingScreen(),
          binding: StartingScreenBinding()),
      GetPage(
          name: "/root", page: () => const UserChecker(), transition: Transition.zoom),
      GetPage(
          name: "/userTypeChecker",
          page: () => const UserTypeChecker(),
          transition: Transition.zoom),
      // GetPage(
      //     name: "/farmerHomeRoot",
      //     page: () => FarmerHomeRoot(),
      //     transition: Transition.zoom),
      // GetPage(
      //     name: "/farmerReportIncident",
      //     page: () => ReportIncident(),
      //     binding: ReportIncidentBinding(),
      //     transition: Transition.zoom),
      // GetPage(
      //     name: "/officerHomeRoot",
      //     page: () => OfficerHomeRoot(),
      //     transition: Transition.zoom),
      // GetPage(
      //     name: "/IncidentInfo",
      //     page: () => IncidentInfo(),
      //     transition: Transition.cupertinoDialog),
      GetPage(
        name: "/registration_screen",
        page: () => UserRegScreen(),
      ),
    ];
  }
}
