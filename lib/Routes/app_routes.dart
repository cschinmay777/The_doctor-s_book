import 'package:doctor_book/screens/appointments_records/appointment_records_screen.dart';
import 'package:doctor_book/screens/forgot_password_screen/bindings/forgot_password_bindings.dart';
import 'package:doctor_book/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:doctor_book/screens/home_screen/bindings/home_screen_bindings.dart';
import 'package:doctor_book/screens/home_screen/home_screen.dart';
import 'package:doctor_book/screens/search_records/bindings/search_page_bindings.dart';
import 'package:doctor_book/screens/search_records/search_records_screen.dart';
import 'package:doctor_book/screens/signup_screen/signup_screen.dart';
import 'package:doctor_book/screens/splash_screen/bindings/splash_bindings.dart';
import 'package:doctor_book/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/add_record_screen/add_new_record.dart';
import '../screens/add_record_screen/bindings/add_record_screen_bindings.dart';
import '../screens/appointments_records/bindings/appointment_page_bindings.dart';
import '../screens/fill_info_screen/bindings/fill_info_bindings.dart';
import '../screens/fill_info_screen/fill_info_screen.dart';
import '../screens/login_screen/bindings/login_bindings.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/signup_screen/bindings/signup_bindings.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String forgotpasswordScreen = '/forgotpassword_screen';

  static const String fillinfoScreen = '/fillinfoScreen';

  static const String homescreen = '/homescreen';

  static String initialRoute = '/initialRoute';

  static String searchrecord = '/searchrecord';

  static String appointmentpagerecord = '/appointmentpage';

  static String addnewrecord = '/addnewrecord';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => Splash_Screen(),
      bindings: [
        Splash_Bindings(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => Splash_Screen(),
      bindings: [
        Splash_Bindings(),
      ],
    ),
    GetPage(
      name: welcomeScreen,
      page: () => Welcome_Screen(),
      // bindings: [
      // SplashBinding(),
      // ],
    ),
    GetPage(
      name: loginScreen,
      page: () => Login_Screen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signupScreen,
      page: () => Signup_Screen(),
      bindings: [
        SignupBindings(),
      ],
    ),
    GetPage(
      name: fillinfoScreen,
      page: () => Fill_Info_Screen(),
      bindings: [
        Fill_Info_Binding(),
      ],
    ),
    GetPage(
        name: forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        bindings: [
          ForgotPasswordBinding(),
        ]),
    GetPage(
      name: homescreen,
      page: () => HomeScreen(),
      bindings: [
        HomeScreenBinding(),
      ],
    ),
    GetPage(
      name: searchrecord,
      page: () => SearchPageScreen(),
      bindings: [
        SearchPageBinding(),
      ],
    ),
    GetPage(
      name: appointmentpagerecord,
      page: () => AppointmentPageScreen(),
      bindings: [
        AppointmentPageBinding(),
      ],
    ),
    GetPage(
      name: addnewrecord,
      page: () => AddNewRecord(),
      bindings: [
        AddRecordPageBinding(),
      ],
    ),
  ];
}
