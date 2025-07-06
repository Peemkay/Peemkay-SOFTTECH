/// Services Preview Section for Home Page
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class ServicesPreview extends ConsumerWidget {
  const ServicesPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: isMobile ? 64 : 100,
      ),
      child: Column(
        children: [
          // Section Header
          Text(
            'Our Services',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.3).fadeIn(),

          const SizedBox(height: 16),

          Text(
            'Comprehensive software development solutions',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondaryDark),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

          const SizedBox(height: 64),

          // Services Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              final isTablet = constraints.maxWidth < 900;

              int crossAxisCount;
              double childAspectRatio;
              double spacing;

              if (isMobile) {
                crossAxisCount = 1;
                childAspectRatio = 0.9;
                spacing = 16;
              } else if (isTablet) {
                crossAxisCount = 2;
                childAspectRatio = 0.85;
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
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return _ServiceCard(
                    service: service,
                    delay: Duration(milliseconds: 400 + (index * 200)),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 48),

          // View All Services Button
          ElevatedButton.icon(
            onPressed: () => context.go('/services'),
            icon: const Icon(FontAwesomeIcons.arrowRight, size: 16),
            label: const Text('View All Services'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).animate().scale(delay: 1000.ms).fadeIn(),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final _ServiceData service;
  final Duration delay;

  const _ServiceCard({required this.service, required this.delay});

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
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : AppColors.primary.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.3)
                    : AppColors.shadowDark.withValues(alpha: 0.2),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Background Image Layer
                if (widget.service.backgroundImage != null)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardDark, // Fallback color
                      ),
                      child: Image.asset(
                        widget.service.backgroundImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) {
                          print(
                            'Failed to load image: ${widget.service.backgroundImage}',
                          );
                          return Container(
                            color: AppColors.cardDark,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    color: AppColors.textSecondaryDark,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Image not found',
                                    style: TextStyle(
                                      color: AppColors.textSecondaryDark,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                // Dark Overlay with Gradient
                if (widget.service.backgroundImage != null)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.6),
                            Colors.black.withValues(alpha: 0.8),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Gradient Background for cards without images
                if (widget.service.backgroundImage == null)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.blackCardGradient,
                      ),
                    ),
                  ),

                // Content Layer
                Container(
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: widget.service.gradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            widget.service.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Title
                        Text(
                          widget.service.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryDark,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        // Description
                        Expanded(
                          child: Text(
                            widget.service.description,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.textSecondaryDark,
                                  height: 1.4,
                                ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Technologies
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: widget.service.technologies.take(4).map((
                            tech,
                          ) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                tech,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().slideY(begin: 0.3, delay: widget.delay).fadeIn();
  }
}

class _ServiceData {
  final String title;
  final String description;
  final IconData icon;
  final List<String> technologies;
  final LinearGradient gradient;
  final String? backgroundImage;

  const _ServiceData({
    required this.title,
    required this.description,
    required this.icon,
    required this.technologies,
    required this.gradient,
    this.backgroundImage,
  });
}

final List<_ServiceData> _services = [
  _ServiceData(
    title: 'Enterprise Solutions',
    description:
        'Comprehensive enterprise applications for military, banking, construction, and large organizations with advanced security and compliance.',
    icon: FontAwesomeIcons.building,
    technologies: ['Flutter', 'Python', 'Security', 'Compliance'],
    gradient: AppColors.primaryGradient,
    backgroundImage: 'assets/images/enterprise_solutions_bg.png',
  ),
  _ServiceData(
    title: 'E-Commerce & Shopping',
    description:
        'Complete e-commerce platforms with payment integration, inventory management, and multi-vendor support for retail businesses.',
    icon: FontAwesomeIcons.cartShopping,
    technologies: ['Flutter', 'Python', 'Payment APIs', 'Analytics'],
    gradient: AppColors.secondaryGradient,
    backgroundImage: 'assets/images/ecommerce_shopping_bg.png',
  ),

  _ServiceData(
    title: 'Transportation & Delivery',
    description:
        'Ride hailing, food delivery, and logistics platforms with real-time tracking, route optimization, and driver management.',
    icon: FontAwesomeIcons.truck,
    technologies: ['Flutter', 'Maps API', 'Real-time', 'GPS'],
    gradient: AppColors.accentGradient,
    backgroundImage: 'assets/images/transportation_delivery_bg.png',
  ),
  _ServiceData(
    title: 'Restaurant & Food Service',
    description:
        'Complete restaurant management systems with POS, online ordering, table reservations, and kitchen management.',
    icon: FontAwesomeIcons.utensils,
    technologies: ['Flutter', 'POS Systems', 'Payment', 'Inventory'],
    gradient: LinearGradient(
      colors: [Color(0xFFDC2626), Color(0xFFEF4444)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    backgroundImage: 'assets/images/restaurant_food_bg.png',
  ),

  _ServiceData(
    title: 'Education & Universities',
    description:
        'Educational platforms with student management, online learning, course administration, and academic tools.',
    icon: FontAwesomeIcons.graduationCap,
    technologies: ['Flutter', 'LMS', 'Video Streaming', 'Analytics'],
    gradient: LinearGradient(
      colors: [Color(0xFF7C3AED), Color(0xFF8B5CF6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    backgroundImage: 'assets/images/education_universities_bg.png',
  ),
  _ServiceData(
    title: 'Real Estate & Housing',
    description:
        'Property management systems, real estate marketplaces, and housing applications with advanced search and CRM.',
    icon: FontAwesomeIcons.house,
    technologies: ['Flutter', 'Maps', 'CRM', 'Search Engine'],
    gradient: LinearGradient(
      colors: [Color(0xFF059669), Color(0xFF10B981)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    backgroundImage: 'assets/images/real_estate_housing_bg.png',
  ),
];
