/// Services Screen for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/glass_container.dart';
import '../widgets/animated_background.dart';
import '../widgets/loading_widget.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

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

              // Services Header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(64, 64, 64, 32),
                  child: Column(
                    children: [
                      Text(
                        'Our Services',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ).animate().slideY(begin: 0.3).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'Comprehensive Digital Solutions for Every Industry',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.textSecondaryDark),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'From concept to deployment, we deliver cutting-edge software solutions that transform businesses and drive innovation across diverse industries.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textTertiaryDark,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 400.ms).fadeIn(),
                    ],
                  ),
                ),
              ),

              // Service Categories
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildServiceCategories(),
                ).animate().slideY(begin: 0.3, delay: 600.ms).fadeIn(),
              ),

              // Main Services Grid
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildServicesGrid(),
                ).animate().slideY(begin: 0.3, delay: 800.ms).fadeIn(),
              ),

              // Technology Stack
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildTechnologyStack(),
                ).animate().slideY(begin: 0.3, delay: 1000.ms).fadeIn(),
              ),

              // Process Overview
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildProcessOverview(),
                ).animate().slideY(begin: 0.3, delay: 1200.ms).fadeIn(),
              ),

              // Service Packages
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildServicePackages(),
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

  Widget _buildServiceCategories() {
    return Builder(
      builder: (context) {
        final categories = [
          {
            'title': 'Web Development',
            'icon': FontAwesomeIcons.globe,
            'count': '15+ Projects',
            'color': AppColors.primary,
          },
          {
            'title': 'Mobile Apps',
            'icon': FontAwesomeIcons.mobileScreenButton,
            'count': '20+ Projects',
            'color': AppColors.accent,
          },
          {
            'title': 'Desktop Software',
            'icon': FontAwesomeIcons.desktop,
            'count': '10+ Projects',
            'color': AppColors.success,
          },
          {
            'title': 'Cloud Solutions',
            'icon': FontAwesomeIcons.cloud,
            'count': '8+ Projects',
            'color': AppColors.warning,
          },
        ];

        return Column(
          children: [
            Text(
              'Service Categories',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((category) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: AppColors.blackCardGradient,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: (category['color'] as Color).withValues(
                          alpha: 0.3,
                        ),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: (category['color'] as Color).withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            category['icon'] as IconData,
                            color: category['color'] as Color,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          category['title'] as String,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryDark,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['count'] as String,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: category['color'] as Color),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildServicesGrid() {
    return Builder(
      builder: (context) {
        final services = [
          {
            'title': 'Military & Defense Systems',
            'description':
                'Advanced security management systems with real-time monitoring, threat detection, and military-grade encryption protocols.',
            'icon': FontAwesomeIcons.shield,
            'features': [
              'Real-time Monitoring',
              'Threat Detection',
              'Secure Communications',
              'Access Control',
            ],
            'technologies': ['Flutter', 'Python', 'AI/ML', 'IoT'],
            'color': AppColors.primary,
          },
          {
            'title': 'Banking & Finance',
            'description':
                'Comprehensive digital banking platforms with mobile apps, web portals, blockchain integration, and financial analytics.',
            'icon': FontAwesomeIcons.buildingColumns,
            'features': [
              'Digital Banking',
              'Payment Processing',
              'Blockchain',
              'Analytics',
            ],
            'technologies': ['Flutter', 'Python', 'Blockchain', 'APIs'],
            'color': AppColors.success,
          },
          {
            'title': 'Educational Platforms',
            'description':
                'Complete school management systems with student portals, teacher dashboards, e-learning platforms, and parent apps.',
            'icon': FontAwesomeIcons.graduationCap,
            'features': [
              'School Management',
              'E-Learning',
              'Student Portal',
              'Analytics',
            ],
            'technologies': ['Flutter', 'Python', 'Cloud', 'Analytics'],
            'color': AppColors.accent,
          },
          {
            'title': 'E-Commerce Solutions',
            'description':
                'Multi-vendor marketplaces with inventory management, payment gateway integration, and comprehensive analytics.',
            'icon': FontAwesomeIcons.cartShopping,
            'features': [
              'Multi-vendor',
              'Inventory Management',
              'Payment Gateway',
              'Analytics',
            ],
            'technologies': ['Flutter', 'Python', 'Payment APIs', 'Cloud'],
            'color': AppColors.warning,
          },
          {
            'title': 'Healthcare Systems',
            'description':
                'Hospital management systems with patient records, appointment scheduling, telemedicine, and medical device integration.',
            'icon': FontAwesomeIcons.heartPulse,
            'features': [
              'Patient Records',
              'Telemedicine',
              'Appointments',
              'Device Integration',
            ],
            'technologies': ['Flutter', 'Python', 'AI', 'Cloud'],
            'color': AppColors.accent,
          },
          {
            'title': 'Transportation & Logistics',
            'description':
                'Ride-hailing applications with driver and passenger apps, real-time tracking, route optimization, and fleet management.',
            'icon': FontAwesomeIcons.car,
            'features': [
              'Real-time Tracking',
              'Route Optimization',
              'Fleet Management',
              'Payment',
            ],
            'technologies': ['Flutter', 'Python', 'Maps API', 'Real-time'],
            'color': AppColors.primary,
          },
        ];

        return Column(
          children: [
            Text(
              'Our Core Services',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;
                final isTablet = constraints.maxWidth < 900;

                int crossAxisCount;
                double childAspectRatio;
                double spacing;

                if (isMobile) {
                  crossAxisCount = 1;
                  childAspectRatio = 0.8;
                  spacing = 16;
                } else if (isTablet) {
                  crossAxisCount = 2;
                  childAspectRatio = 0.75;
                  spacing = 20;
                } else {
                  crossAxisCount = 3;
                  childAspectRatio = 0.8;
                  spacing = 24;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: spacing,
                    crossAxisSpacing: spacing,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return _ServiceCard(service: service);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTechnologyStack() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Technology Stack',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          // Technology stack content will be added here
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
              'Technology stack details coming soon...',
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

  Widget _buildProcessOverview() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Our Development Process',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          // Process overview content will be added here
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
              'Development process details coming soon...',
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

  Widget _buildServicePackages() {
    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'Service Packages',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          // Service packages content will be added here
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
              'Service packages details coming soon...',
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

class _ServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppConstants.shortAnimation,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.blackCardGradient,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? (widget.service['color'] as Color).withValues(alpha: 0.5)
                  : (widget.service['color'] as Color).withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? (widget.service['color'] as Color).withValues(alpha: 0.3)
                    : AppColors.shadowDark.withValues(alpha: 0.2),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: (widget.service['color'] as Color).withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    widget.service['icon'] as IconData,
                    color: widget.service['color'] as Color,
                    size: 24,
                  ),
                ),

                const SizedBox(height: 16),

                // Service Title
                Text(
                  widget.service['title'] as String,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryDark,
                  ),
                ),

                const SizedBox(height: 12),

                // Service Description
                Expanded(
                  child: Text(
                    widget.service['description'] as String,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryDark,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Features
                Text(
                  'Key Features:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.service['color'] as Color,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (widget.service['features'] as List<String>)
                      .map(
                        (feature) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: (widget.service['color'] as Color)
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            feature,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: widget.service['color'] as Color,
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 16),

                // Technologies
                Text(
                  'Technologies:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiaryDark,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  (widget.service['technologies'] as List<String>).join(' • '),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiaryDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
