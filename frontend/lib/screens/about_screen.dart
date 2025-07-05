/// About Screen for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/glass_container.dart';
import '../widgets/animated_background.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: AnimatedBackground(
        enableParticles: true,
        enableGradientShift: true,
        enableFloatingElements: !isMobile,
        child: Container(
          decoration: const BoxDecoration(gradient: AppColors.darkGradient),
          child: CustomScrollView(
            slivers: [
              // Navigation Bar
              SliverToBoxAdapter(
                child: const AppNavbar().animate().fadeIn(
                  duration: AppConstants.mediumAnimation,
                ),
              ),

              // About Header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(64, 64, 64, 32),
                  child: Column(
                    children: [
                      Text(
                        'About Peemkay SOFTTECH',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ).animate().slideY(begin: 0.3).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'Transforming Ideas into Digital Reality',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.textSecondaryDark),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'We are a leading software development company specializing in creating innovative digital solutions across diverse industries, from military-grade security systems to user-friendly educational platforms.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textTertiaryDark,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 400.ms).fadeIn(),
                    ],
                  ),
                ),
              ),

              // Company Story
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildCompanyStory(),
                ).animate().slideY(begin: 0.3, delay: 600.ms).fadeIn(),
              ),

              // Mission & Vision
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildMissionVision(),
                ).animate().slideY(begin: 0.3, delay: 800.ms).fadeIn(),
              ),

              // Team Section
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildTeamSection(),
                ).animate().slideY(begin: 0.3, delay: 1000.ms).fadeIn(),
              ),

              // Company Values
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildCompanyValues(),
                ).animate().slideY(begin: 0.3, delay: 1200.ms).fadeIn(),
              ),

              // Achievements & Stats
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildAchievements(),
                ).animate().slideY(begin: 0.3, delay: 1400.ms).fadeIn(),
              ),

              // Footer
              SliverToBoxAdapter(
                child: const AppFooter().animate().fadeIn(
                  duration: AppConstants.mediumAnimation,
                  delay: const Duration(milliseconds: 600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyStory() {
    return Builder(
      builder: (context) => Column(
        children: [
          // Founder Profile Section
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: AppColors.blackCardGradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                // Profile Photo
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.5),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      'assets/images/profile_photo.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.blackCardGradient,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: AppColors.primary,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 32),

                // Founder Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IT Engineer',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Mubarak Bako Abubakar',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimaryDark,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Founder & CEO, Peemkay SOFTTECH',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'A visionary software engineer and entrepreneur passionate about transforming ideas into digital reality. With expertise in Python and Flutter development, Arie leads Peemkay SOFTTECH in delivering innovative solutions across diverse industries.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondaryDark,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Contact Info
                      Row(
                        children: [
                          Icon(Icons.email, size: 20, color: AppColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            'ariepeemkay@gmail.com',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textTertiaryDark),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 20, color: AppColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            '+2349113080869',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textTertiaryDark),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Dutsen Alhaji, Abuja, Nigeria',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textTertiaryDark),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Company Story
          Row(
            children: [
              // Company Story Text
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Story',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Founded with a Vision',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Peemkay SOFTTECH was founded with a clear vision: to bridge the gap between innovative technology and real-world business needs. Our journey began with a passion for creating software solutions that not only meet technical requirements but also drive meaningful business outcomes.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondaryDark,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'From our headquarters in Abuja, Nigeria, we have grown to serve clients across diverse industries, from military and defense to education and healthcare. Our commitment to excellence and innovation has made us a trusted partner for organizations seeking reliable, scalable, and secure software solutions.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondaryDark,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 64),

              // Company Stats
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: AppColors.blackCardGradient,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Company Logo
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(38),
                          child: Image.asset(
                            'assets/icons/app_logo.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.primary.withValues(alpha: 0.8),
                                      AppColors.accent.withValues(alpha: 0.8),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(38),
                                ),
                                child: Icon(
                                  Icons.business,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Established',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimaryDark,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '2019',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Projects Completed',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimaryDark,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '50+',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMissionVision() {
    return Builder(
      builder: (context) => Row(
        children: [
          // Mission
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: AppColors.blackCardGradient,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.flag, size: 40, color: AppColors.primary),
                  const SizedBox(height: 16),
                  Text(
                    'Our Mission',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'To empower businesses and organizations with innovative, reliable, and scalable software solutions that drive digital transformation and create lasting value.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondaryDark,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 32),

          // Vision
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: AppColors.blackCardGradient,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.visibility, size: 40, color: AppColors.accent),
                  const SizedBox(height: 16),
                  Text(
                    'Our Vision',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'To be the leading software development company in Africa, recognized for our technical excellence, innovation, and commitment to transforming ideas into digital reality.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondaryDark,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Meet Our Team',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: AppColors.blackCardGradient,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              'Team member profiles and expertise details coming soon...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondaryDark,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyValues() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Our Values',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: AppColors.blackCardGradient,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              'Company values and principles details coming soon...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondaryDark,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Our Achievements',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: AppColors.blackCardGradient,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              'Company achievements and milestones details coming soon...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondaryDark,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
