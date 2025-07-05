/// Home Screen for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/app_navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/services_preview.dart';
import '../widgets/portfolio_preview.dart';
import '../widgets/about_preview.dart';
import '../widgets/contact_preview.dart';
import '../widgets/app_footer.dart';
import '../widgets/glass_container.dart';
import '../widgets/animated_background.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: AppConstants.longAnimation,
      vsync: this,
    );

    _scrollController.addListener(_scrollListener);

    // Start animations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 500 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (_scrollController.offset <= 500 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: AppConstants.longAnimation,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: AnimatedBackground(
        enableParticles: true,
        enableGradientShift: true,
        enableFloatingElements: !isMobile,
        child: Stack(
          children: [
            // Main Content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Navigation Bar
                SliverToBoxAdapter(
                  child: const AppNavbar().animate().fadeIn(
                    duration: AppConstants.mediumAnimation,
                  ),
                ),

                // Hero Section
                SliverToBoxAdapter(
                  child: const HeroSection()
                      .animate()
                      .slideY(
                        begin: 0.3,
                        duration: AppConstants.longAnimation,
                        curve: Curves.easeOut,
                      )
                      .fadeIn(),
                ),

                // Services Preview
                SliverToBoxAdapter(
                  child: const ServicesPreview()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        duration: AppConstants.longAnimation,
                        delay: const Duration(milliseconds: 200),
                      )
                      .fadeIn(),
                ),

                // Portfolio Preview
                SliverToBoxAdapter(
                  child: const PortfolioPreview()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        duration: AppConstants.longAnimation,
                        delay: const Duration(milliseconds: 400),
                      )
                      .fadeIn(),
                ),

                // About Preview
                SliverToBoxAdapter(
                  child: const AboutPreview()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        duration: AppConstants.longAnimation,
                        delay: const Duration(milliseconds: 600),
                      )
                      .fadeIn(),
                ),

                // Contact Preview
                SliverToBoxAdapter(
                  child: const ContactPreview()
                      .animate()
                      .slideY(
                        begin: 0.2,
                        duration: AppConstants.longAnimation,
                        delay: const Duration(milliseconds: 800),
                      )
                      .fadeIn(),
                ),

                // Footer
                SliverToBoxAdapter(
                  child: const AppFooter().animate().fadeIn(
                    duration: AppConstants.mediumAnimation,
                    delay: const Duration(milliseconds: 1000),
                  ),
                ),
              ],
            ),

            // Back to Top Button
            if (_showBackToTop)
              Positioned(
                right: isMobile ? 16 : 32,
                bottom: isMobile ? 16 : 32,
                child: FloatingActionButton(
                  onPressed: _scrollToTop,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  child: const Icon(Icons.keyboard_arrow_up),
                ).animate().scale(duration: AppConstants.shortAnimation),
              ),
          ],
        ),
      ),
    );
  }
}
