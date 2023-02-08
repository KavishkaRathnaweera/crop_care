import 'package:cropcare/controllers/bindings/report_incident_binding.dart';
import 'package:cropcare/screens/auth/signup_screen.dart';
import 'package:cropcare/screens/common/splash_screen.dart';
import 'package:cropcare/screens/farmer/home_root.dart';
import 'package:cropcare/screens/farmer/report_incident.dart';
import 'package:get/get.dart';

import '../controllers/bindings/splash_binding.dart';
import '../screens/common/root.dart';
import '../screens/common/root_home.dart';
import '../screens/officer/home_root.dart';
import '../screens/officer/incident_info.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(
          name: "/",
          page: () => const SplashScreen(),
          binding: SplashBinding()),
      GetPage(
          name: "/root", page: () => const Root(), transition: Transition.zoom),
      GetPage(
          name: "/rootHome",
          page: () => const RootHome(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerHomeRoot",
          page: () => FarmerHomeRoot(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerReportIncident",
          page: () => ReportIncident(),
          binding: ReportIncidentBinding(),
          transition: Transition.zoom),
      GetPage(
          name: "/officerHomeRoot",
          page: () => OfficerHomeRoot(),
          transition: Transition.zoom),
      GetPage(
          name: "/IncidentInfo",
          page: () => IncidentInfo(),
          transition: Transition.cupertinoDialog),
      GetPage(
        name: "/signup-screen",
        page: () => SignUpScreen(),
      ),
    ];
  }
}
