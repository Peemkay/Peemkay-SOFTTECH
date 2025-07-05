/// Splash Screen for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import 'themed_logo.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _progressController;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _progress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  void _startAnimation() async {
    // Start logo animation
    _logoController.forward();

    // Wait a bit then start progress
    await Future.delayed(const Duration(milliseconds: 500));
    _progressController.forward();

    // Complete after animations
    await Future.delayed(const Duration(milliseconds: 3000));
    widget.onComplete();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.richBlack,
              AppColors.charcoal,
              AppColors.darkGray,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Section
              AnimatedBuilder(
                animation: _logoController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _logoScale.value,
                    child: Opacity(
                      opacity: _logoOpacity.value,
                      child: const GradientLogo(
                        size: 120,
                        borderRadius: 20,
                        showShadow: true,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // Company Name
              Text(
                AppConstants.companyName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ).animate().slideY(begin: 0.3, delay: 800.ms).fadeIn(),

              const SizedBox(height: 8),

              // Tagline
              Text(
                AppConstants.tagline,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondaryDark,
                ),
                textAlign: TextAlign.center,
              ).animate().slideY(begin: 0.2, delay: 1000.ms).fadeIn(),

              const SizedBox(height: 48),

              // Loading Progress
              Container(
                width: 200,
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _progress,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _progress.value,
                          backgroundColor: AppColors.borderLight,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                          minHeight: 4,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    AnimatedBuilder(
                      animation: _progress,
                      builder: (context, child) {
                        final percentage = (_progress.value * 100).round();
                        String loadingText = 'Initializing...';

                        if (percentage > 20) loadingText = 'Loading assets...';
                        if (percentage > 40)
                          loadingText = 'Preparing interface...';
                        if (percentage > 60)
                          loadingText = 'Setting up portfolio...';
                        if (percentage > 80) loadingText = 'Almost ready...';
                        if (percentage >= 100) loadingText = 'Welcome!';

                        return Text(
                          loadingText,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textTertiaryLight),
                        );
                      },
                    ),
                  ],
                ),
              ).animate().slideY(begin: 0.3, delay: 1200.ms).fadeIn(),

              const SizedBox(height: 32),

              // Tech Stack Preview
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TechIcon(FontAwesomeIcons.python, AppColors.primary),
                  const SizedBox(width: 16),
                  _TechIcon(FontAwesomeIcons.mobile, AppColors.secondary),
                  const SizedBox(width: 16),
                  _TechIcon(FontAwesomeIcons.globe, AppColors.accent),
                ],
              ).animate().slideY(begin: 0.3, delay: 1400.ms).fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _TechIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }
}
