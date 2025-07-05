/// Peemkay SOFTTECH Portfolio Website
/// Modern, responsive portfolio built with Flutter
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_theme.dart';
import 'constants/app_constants.dart';
import 'screens/home_screen.dart';
import 'screens/services_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Google Fonts are loaded
  await GoogleFonts.pendingFonts([GoogleFonts.inter()]);

  runApp(const ProviderScope(child: PeemkaySoftechAppWrapper()));
}

class PeemkaySoftechApp extends ConsumerWidget {
  const PeemkaySoftechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900), // Desktop design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppConstants.companyName,
          debugShowCheckedModeBanner: false,

          // Theme Configuration
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,

          // Responsive Framework
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),

          // Router Configuration
          routerConfig: _router,
        );
      },
    );
  }
}

// Router Configuration
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/services',
      name: 'services',
      builder: (context, state) => const ServicesScreen(),
    ),
    GoRoute(
      path: '/portfolio',
      name: 'portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      name: 'contact',
      builder: (context, state) => const ContactScreen(),
    ),
  ],
);

class PeemkaySoftechAppWrapper extends StatefulWidget {
  const PeemkaySoftechAppWrapper({super.key});

  @override
  State<PeemkaySoftechAppWrapper> createState() =>
      _PeemkaySoftechAppWrapperState();
}

class _PeemkaySoftechAppWrapperState extends State<PeemkaySoftechAppWrapper> {
  bool _showSplash = true;

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.companyName,
      debugShowCheckedModeBanner: false,
      home: _showSplash
          ? SplashScreen(onComplete: _onSplashComplete)
          : const PeemkaySoftechApp(),
    );
  }
}
