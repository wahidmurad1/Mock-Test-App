import 'package:mock_test_app/utils/constants/imports.dart';


//* info:: auth screens

const String krLogin = '/login';
const String krOtpScreen = '/otp-screen';
//*Intro and Splash Screen
const String krSplashScreen = '/splash-screen';

//*Home Screen
const String krHomeScreen = '/home-screen';
//* info:: profile and more screens
const String krProfile = '/profile';

//*All Tests
const String krTestScreen = '/test-screen';

//*All Routes

List<GetPage<dynamic>>? routes = [
  //* info:: auth screens
  GetPage(name: krLogin, page: () => LoginScreen(), transition: Transition.noTransition),
  GetPage(name: krOtpScreen, page: () => OTPScreen(), transition: Transition.noTransition),

  //* info:: other screens
  GetPage(name: krSplashScreen, page: () => SplashScreen(), transition: Transition.noTransition),

  //*Home Screen
  GetPage(name: krHomeScreen, page: () => HomeScreen(), transition: Transition.noTransition),

  //* info:: profile and more screens
  GetPage(name: krProfile, page: () => ProfileScreen(), transition: Transition.noTransition),
  //*Test Screens
  GetPage(name: krTestScreen, page: () => TestScreen(), transition: Transition.noTransition),

];
