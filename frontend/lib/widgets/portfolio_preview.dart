/// Portfolio Preview Section for Home Page
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class PortfolioPreview extends ConsumerWidget {
  const PortfolioPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: isMobile ? 64 : 100,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight.withOpacity(0.5),
      ),
      child: Column(
        children: [
          // Section Header
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.3).fadeIn(),

          const SizedBox(height: 16),

          Text(
            'Showcasing our best work and achievements',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

          const SizedBox(height: 64),

          // Portfolio Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              final isTablet = constraints.maxWidth < 900;

              int crossAxisCount;
              double childAspectRatio;
              double spacing;

              if (isMobile) {
                crossAxisCount = 1;
                childAspectRatio = 1.1;
                spacing = 16;
              } else if (isTablet) {
                crossAxisCount = 2;
                childAspectRatio = 1.0;
                spacing = 20;
              } else {
                crossAxisCount = 3;
                childAspectRatio = 1.1;
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
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  final project = _projects[index];
                  return _ProjectCard(
                    project: project,
                    delay: Duration(milliseconds: 400 + (index * 200)),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 48),

          // View All Projects Button
          ElevatedButton.icon(
            onPressed: () => context.go('/portfolio'),
            icon: const Icon(FontAwesomeIcons.briefcase, size: 16),
            label: const Text('View All Projects'),
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

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;
  final Duration delay;

  const _ProjectCard({required this.project, required this.delay});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: widget.project.gradient,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        widget.project.icon,
                        size: 60,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    if (widget.project.featured)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                FontAwesomeIcons.star,
                                size: 12,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Featured',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Project Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.project.category,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Title
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimaryDark,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Description
                      Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondaryDark,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      // Technologies
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.project.technologies.take(3).map((
                          tech,
                        ) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tech,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppColors.accent,
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
    ).animate().slideY(begin: 0.3, delay: widget.delay).fadeIn();
  }
}

class _ProjectData {
  final String title;
  final String description;
  final String category;
  final IconData icon;
  final List<String> technologies;
  final LinearGradient gradient;
  final bool featured;

  const _ProjectData({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.technologies,
    required this.gradient,
    this.featured = false,
  });
}

final List<_ProjectData> _projects = [
  _ProjectData(
    title: 'Military Command & Control System',
    description:
        'Secure military-grade command and control platform with real-time tactical data, encrypted communications, and mission planning capabilities.',
    category: 'Enterprise',
    icon: FontAwesomeIcons.shield,
    technologies: ['Flutter', 'Python', 'PostgreSQL', 'Encryption'],
    gradient: LinearGradient(
      colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    featured: true,
  ),
  _ProjectData(
    title: 'Digital Banking Platform',
    description:
        'Comprehensive banking solution with secure transactions, account management, loan processing, and regulatory compliance features.',
    category: 'Web App',
    icon: FontAwesomeIcons.university,
    technologies: ['Flutter', 'Python', 'FastAPI', 'Blockchain'],
    gradient: LinearGradient(
      colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    featured: true,
  ),
  _ProjectData(
    title: 'Ride Hailing & Delivery App',
    description:
        'Multi-service platform for ride hailing, food delivery, and package delivery with real-time tracking, payment integration, and driver management.',
    category: 'Mobile App',
    icon: FontAwesomeIcons.car,
    technologies: ['Flutter', 'Python', 'Google Maps', 'Stripe'],
    gradient: AppColors.primaryGradient,
    featured: true,
  ),
  _ProjectData(
    title: 'Restaurant Management Suite',
    description:
        'Complete restaurant management system with POS, inventory management, online ordering, table reservations, and staff scheduling.',
    category: 'Web App',
    icon: FontAwesomeIcons.utensils,
    technologies: ['Flutter', 'Python', 'FastAPI', 'Payment APIs'],
    gradient: LinearGradient(
      colors: [Color(0xFFDC2626), Color(0xFFEF4444)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _ProjectData(
    title: 'E-Commerce & Shopping Platform',
    description:
        'Multi-vendor e-commerce platform with advanced search, recommendation engine, secure payments, and comprehensive admin dashboard.',
    category: 'Web App',
    icon: FontAwesomeIcons.shoppingCart,
    technologies: ['Flutter', 'Python', 'AI/ML', 'PostgreSQL'],
    gradient: AppColors.secondaryGradient,
    featured: true,
  ),
  _ProjectData(
    title: 'Grocery Delivery System',
    description:
        'On-demand grocery delivery platform with inventory management, route optimization, and real-time order tracking.',
    category: 'Mobile App',
    icon: FontAwesomeIcons.shoppingBasket,
    technologies: ['Flutter', 'Python', 'Maps API', 'Redis'],
    gradient: LinearGradient(
      colors: [Color(0xFF059669), Color(0xFF10B981)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _ProjectData(
    title: 'Construction Project Manager',
    description:
        'Comprehensive construction management platform with project tracking, resource allocation, safety compliance, and progress reporting.',
    category: 'Desktop App',
    icon: FontAwesomeIcons.hardHat,
    technologies: ['Flutter', 'Python', 'SQLite', 'File Management'],
    gradient: LinearGradient(
      colors: [Color(0xFFD97706), Color(0xFFF59E0B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  _ProjectData(
    title: 'University Management System',
    description:
        'Complete educational platform with student information system, course management, online learning, and administrative tools.',
    category: 'Web App',
    icon: FontAwesomeIcons.graduationCap,
    technologies: ['Flutter', 'Python', 'FastAPI', 'Video Streaming'],
    gradient: LinearGradient(
      colors: [Color(0xFF7C3AED), Color(0xFF8B5CF6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
];
