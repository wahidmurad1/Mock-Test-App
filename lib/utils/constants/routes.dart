import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/views/auth/login_screen.dart';

//* info:: auth screens



const String krLogin = '/login';
// const String krForgotPassword = '/forgot-password';
// const String krResetPass = '/reset-pass';
// const String krOTP = '/otp-verify';

const String krSplashScreen = '/splash-screen';
// const String krHome = '/home';

//* info:: profile and more screens
// const String krProfileDetails = '/profile-details';
// const String krEditUserProfile = '/edit-user-profile';


//*Newly Added
// const String krSubscriptionDetailsPage = '/subscription-data';
// const String krContactUs = '/contact-us';
// const String krContactUsMessageDetails = '/message-details';
// const String krBlogDetails = '/blog-details';
// const String krTermsAndCondition = '/terms-condition';

List<GetPage<dynamic>>? routes = [
  //* info:: auth screens
  GetPage(name: krLogin, page: () => LoginScreen(), transition: Transition.noTransition),
  // GetPage(name: krForgotPassword, page: () => ForgotPasswordScreen(), transition: Transition.noTransition),

  //* info:: other screens
  GetPage(name: krSplashScreen, page: () => SplashScreen(), transition: Transition.noTransition),
 

  //* info:: profile and more screens
  // GetPage(name: krProfileDetails, page: () => ProfilePage(), transition: Transition.noTransition),
  // GetPage(name: krEditUserProfile, page: () => EditProfile(), transition: Transition.noTransition),
  // GetPage(name: krDeleteProfileReason, page: () => DeleteProfileReason(), transition: Transition.noTransition),
  // GetPage(name: krDeleteProfile, page: () => DeleteProfile(), transition: Transition.noTransition),
  // GetPage(name: krAffiliateLink, page: () => AffiliateLink(), transition: Transition.noTransition),
  // GetPage(name: krSubscription, page: () => SubscriptionPage(), transition: Transition.noTransition),
  //*Newly Added
  // GetPage(name: krChangePassword, page: () => ChangePasswordScreen(), transition: Transition.noTransition),
  // GetPage(name: krSubscriptionDetailsPage, page: () => SubscriptionDetailsPage(), transition: Transition.noTransition),
  // GetPage(name: krContactUs, page: () => ContactUs(), transition: Transition.noTransition),
  // GetPage(name: krContactUsMessageDetails, page: () => ContactUsMessageDetails(), transition: Transition.noTransition),
  // GetPage(name: krBlogDetails, page: () => BlogDetailsPage(), transition: Transition.noTransition),
  // GetPage(name: krTermsAndCondition, page: () => TermsAndCondition(), transition: Transition.noTransition),
];
