import 'package:absher_app/core/dependancy_injection/dependancy_injection.dart';
import 'package:absher_app/core/routing/app_routes.dart';
import 'package:absher_app/features/admin/screens/home/provider/interpreter_provider.dart';
import 'package:absher_app/features/user/chat/provider/chat_provider.dart';
import 'package:absher_app/features/user/home/provider/opinions_provider.dart';
import 'package:absher_app/features/user/notifications/provider/notifications_provider.dart';
import 'package:absher_app/features/user/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator<ChatProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<NotificationsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<ProfileProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<ProfileProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<OpinionsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<InterpreterProvider>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              // useInheritedMediaQuery: true,
              locale: Locale('ar'),
              // builder: DevicePreview.appBuilder,
              supportedLocales: [
                Locale('ar'),
                Locale('en'),
              ],
              navigatorKey: navigatorKey,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: AppRoutes.quranSplashScreen,
              // home: AudioRecorderScreen(),
              routes: AppRoutes.routes);
        },
      ),
    );
  }
}
