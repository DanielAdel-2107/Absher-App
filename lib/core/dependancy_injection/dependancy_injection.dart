import 'package:absher_app/features/admin/screens/home/provider/explanation_provider.dart';
import 'package:absher_app/features/admin/screens/home/provider/explanation_ro2ya_provider.dart';
import 'package:absher_app/features/admin/screens/home/provider/feedback_provider.dart';
import 'package:absher_app/features/admin/screens/home/provider/interpreter_provider.dart';
import 'package:absher_app/features/auth/create_interpreter_account/provider/create_interpreter_account_provider.dart';
import 'package:absher_app/features/auth/provider/sign_in_provider.dart';
import 'package:absher_app/features/auth/provider/sign_up_provider.dart';
import 'package:absher_app/features/admin/screens/dashboard/provider/dashboard_provider.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:absher_app/features/user/home/provider/bottom_navigation_provider.dart';
import 'package:absher_app/features/user/home/provider/opinions_provider.dart';
import 'package:absher_app/features/user/home/provider/user_provider.dart';
import 'package:absher_app/features/user/notifications/provider/notifications_provider.dart';
import 'package:absher_app/features/user/payment/provider/payment_provider.dart';
import 'package:absher_app/features/user/profile/provider/feedback_provider.dart';
import 'package:absher_app/features/user/profile/provider/profile_provider.dart';
import 'package:absher_app/features/user/ro2ya/provider/steps_provider.dart';
import 'package:get_it/get_it.dart';

// Create an instance of GetIt
final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<StepsProvider>(() => StepsProvider());
  locator.registerFactory<SignInProvider>(() => SignInProvider());
  locator.registerFactory<SignUpProvider>(() => SignUpProvider());
  locator.registerFactory<UserProvider>(() => UserProvider());
  locator.registerFactory<FeedbackProviderForUser>(
      () => FeedbackProviderForUser());
  locator.registerFactory<FeedbackProviderForAdmin>(
      () => FeedbackProviderForAdmin());
  locator.registerFactory<ExplanationRo2yaProvider>(
      () => ExplanationRo2yaProvider());
  locator.registerFactory<ExplanationProvider>(() => ExplanationProvider());
  locator.registerFactory<InterpreterProvider>(() => InterpreterProvider());
  locator.registerFactory<DashboardProvider>(() => DashboardProvider());
  locator.registerFactory<ProfileProvider>(() => ProfileProvider());
  locator.registerFactory<PaymentProvider>(() => PaymentProvider());
  locator.registerLazySingleton<ChatProvider>(() => ChatProvider());
  locator.registerFactory<CreateInterpreterAccountProvider>(
      () => CreateInterpreterAccountProvider());
  locator.registerFactory<OpinionsProvider>(() => OpinionsProvider());
  locator.registerFactory<BottomNavigationBarProvider>(
      () => BottomNavigationBarProvider());
  locator.registerFactory<NotificationsProvider>(
      () => NotificationsProvider());
}
