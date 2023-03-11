import '../screen/home_screen.dart';
import '../screen/forgot_password_screen.dart';
import '../screen/login_screen.dart';
import '../screen/person_info_screen.dart';
import '../screen/signup_screen.dart';
import '../screen/splash_screen.dart';

var allRoutes = {
  'loginScreen': (context) => const LoginScreen(),
  'splashScreen': (context) => const SplashScreen(),
  'singupScreen': (context) => const SingupScreen(),
  'forgotPasswordScreen': (context) => const ForgotPasswordScreen(),
  'homeScreen': (context) => const HomeScreen(),
  'personInfoScreen': (context) => const PersonInfoScreen(),
};

class AllRoutesManager {
  static const String loginScreen = 'loginScreen';
  static const String splashScreen = 'splashScreen';
  static const String singupScreen = 'singupScreen';
  static const String forgotpassword = 'forgotPasswordScreen';
  static const String homeScreen = 'homeScreen';
  static const String personInfoScreen = 'personInfoScreen';
}
