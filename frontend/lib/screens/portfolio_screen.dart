/// Portfolio Screen for Peemkay SOFTTECH Portfolio
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
import '../widgets/loading_widget.dart';
import '../widgets/animated_background.dart';

class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: AnimatedBackground(
        key: const ValueKey('portfolio_background'),
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

              // Portfolio Header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(64, 64, 64, 32),
                  child: Column(
                    children: [
                      Text(
                        'Our Portfolio',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ).animate().slideY(begin: 0.3).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'Showcasing Excellence Across Diverse Industries',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.textSecondaryDark),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

                      const SizedBox(height: 16),

                      Text(
                        'From military-grade security systems to user-friendly educational platforms, explore our comprehensive portfolio of innovative digital solutions.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textTertiaryDark,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().slideY(begin: 0.2, delay: 400.ms).fadeIn(),
                    ],
                  ),
                ),
              ),

              // Portfolio Categories Filter
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 16,
                  ),
                  child: _buildCategoryFilter(),
                ).animate().slideY(begin: 0.3, delay: 600.ms).fadeIn(),
              ),

              // Portfolio Projects Grid
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildPortfolioGrid(),
                ).animate().slideY(begin: 0.3, delay: 800.ms).fadeIn(),
              ),

              // Portfolio Statistics
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 32,
                  ),
                  child: _buildPortfolioStats(),
                ).animate().slideY(begin: 0.3, delay: 1000.ms).fadeIn(),
              ),

              // Client Testimonials
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(64),
                  child: _buildTestimonials(),
                ).animate().slideY(begin: 0.3, delay: 1200.ms).fadeIn(),
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

  Widget _buildCategoryFilter() {
    final categories = [
      'All Projects',
      'Military & Defense',
      'Banking & Finance',
      'E-Commerce',
      'Education',
      'Healthcare',
      'Transportation',
      'Real Estate',
      'Construction',
      'Restaurants',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == 'All Projects';
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                // TODO: Implement category filtering
              },
              backgroundColor: AppColors.charcoal,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondaryDark,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.borderDark,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPortfolioGrid() {
    final projects = [
      {
        'title': 'SecureGuard Military System',
        'category': 'Military & Defense',
        'description':
            'Advanced security management system for military installations with real-time monitoring and threat detection.',
        'technologies': ['Flutter', 'Python', 'AI/ML', 'IoT'],
        'image': 'assets/images/project1.jpg',
        'status': 'Completed',
        'year': '2024',
        'client': 'Defense Ministry',
      },
      {
        'title': 'BankPro Digital Platform',
        'category': 'Banking & Finance',
        'description':
            'Comprehensive digital banking solution with mobile app, web portal, and admin dashboard.',
        'technologies': ['Flutter', 'Python', 'Blockchain', 'APIs'],
        'image': 'assets/images/project2.jpg',
        'status': 'Completed',
        'year': '2024',
        'client': 'First Bank Nigeria',
      },
      {
        'title': 'EduLearn Management System',
        'category': 'Education',
        'description':
            'Complete school management system with student portal, teacher dashboard, and parent app.',
        'technologies': ['Flutter', 'Python', 'Cloud', 'Analytics'],
        'image': 'assets/images/project3.jpg',
        'status': 'Completed',
        'year': '2023',
        'client': 'University of Abuja',
      },
      {
        'title': 'ShopMart E-Commerce',
        'category': 'E-Commerce',
        'description':
            'Multi-vendor e-commerce platform with inventory management and payment integration.',
        'technologies': ['Flutter', 'Python', 'Payment APIs', 'Analytics'],
        'image': 'assets/images/project4.jpg',
        'status': 'In Progress',
        'year': '2024',
        'client': 'ShopMart Nigeria',
      },
      {
        'title': 'HealthCare Plus',
        'category': 'Healthcare',
        'description':
            'Hospital management system with patient records, appointment scheduling, and telemedicine.',
        'technologies': ['Flutter', 'Python', 'AI', 'Cloud'],
        'image': 'assets/images/project5.jpg',
        'status': 'Completed',
        'year': '2023',
        'client': 'National Hospital',
      },
      {
        'title': 'RideEasy Transport',
        'category': 'Transportation',
        'description':
            'Ride-hailing application with driver and passenger apps, real-time tracking, and payment.',
        'technologies': ['Flutter', 'Python', 'Maps API', 'Real-time'],
        'image': 'assets/images/project6.jpg',
        'status': 'Completed',
        'year': '2024',
        'client': 'RideEasy Ltd',
      },
    ];

    return LayoutBuilder(
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
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return _ProjectCard(
              project: project,
              delay: Duration(milliseconds: 200 + (index * 100)),
            );
          },
        );
      },
    );
  }

  Widget _buildPortfolioStats() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: AppColors.blackCardGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatCard(
            number: '50+',
            label: 'Projects Completed',
            icon: FontAwesomeIcons.checkCircle,
          ),
          _StatCard(
            number: '25+',
            label: 'Happy Clients',
            icon: FontAwesomeIcons.users,
          ),
          _StatCard(
            number: '12+',
            label: 'Industries Served',
            icon: FontAwesomeIcons.industry,
          ),
          _StatCard(
            number: '5+',
            label: 'Years Experience',
            icon: FontAwesomeIcons.calendar,
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials() {
    final testimonials = [
      {
        'name': 'Col. Ahmed Ibrahim',
        'position': 'Defense Ministry',
        'company': 'Nigerian Armed Forces',
        'testimonial':
            'Peemkay SOFTTECH delivered a world-class security system that exceeded our expectations. Their attention to detail and security protocols is exceptional.',
        'rating': 5,
      },
      {
        'name': 'Dr. Sarah Okafor',
        'position': 'IT Director',
        'company': 'First Bank Nigeria',
        'testimonial':
            'The digital banking platform they built has transformed our customer experience. Professional, reliable, and innovative solutions.',
        'rating': 5,
      },
      {
        'name': 'Prof. Michael Adebayo',
        'position': 'Vice Chancellor',
        'company': 'University of Abuja',
        'testimonial':
            'Their education management system has streamlined our operations significantly. Excellent work and ongoing support.',
        'rating': 5,
      },
    ];

    return Builder(
      builder: (context) => Column(
        children: [
          Text(
            'What Our Clients Say',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Container(
                  width: 350,
                  margin: const EdgeInsets.only(right: 24),
                  padding: const EdgeInsets.all(24),
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
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            FontAwesomeIcons.solidStar,
                            color: starIndex < (testimonial['rating'] as int)
                                ? AppColors.gold
                                : AppColors.mediumGray,
                            size: 16,
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Text(
                          testimonial['testimonial'] as String,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.textSecondaryDark,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        testimonial['name'] as String,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimaryDark,
                            ),
                      ),
                      Text(
                        '${testimonial['position']} at ${testimonial['company']}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
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
              // Project Image Placeholder
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        _getCategoryIcon(widget.project['category'] as String),
                        size: 60,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            widget.project['status'] as String,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.project['status'] as String,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Project Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Text(
                        widget.project['category'] as String,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Title
                      Text(
                        widget.project['title'] as String,
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
                          widget.project['description'] as String,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.textSecondaryDark),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Technologies
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children:
                            (widget.project['technologies'] as List<String>)
                                .take(3)
                                .map(
                                  (tech) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      tech,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.primary,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),

                      const SizedBox(height: 12),

                      // Client and Year
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.project['client'] as String,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppColors.textTertiaryDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            widget.project['year'] as String,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.textTertiaryDark),
                          ),
                        ],
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

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Military & Defense':
        return FontAwesomeIcons.shield;
      case 'Banking & Finance':
        return FontAwesomeIcons.buildingColumns;
      case 'E-Commerce':
        return FontAwesomeIcons.cartShopping;
      case 'Education':
        return FontAwesomeIcons.graduationCap;
      case 'Healthcare':
        return FontAwesomeIcons.heartPulse;
      case 'Transportation':
        return FontAwesomeIcons.car;
      case 'Real Estate':
        return FontAwesomeIcons.building;
      case 'Construction':
        return FontAwesomeIcons.hammer;
      case 'Restaurants':
        return FontAwesomeIcons.utensils;
      default:
        return FontAwesomeIcons.laptop;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return AppColors.success;
      case 'In Progress':
        return AppColors.warning;
      case 'Planning':
        return AppColors.accent;
      default:
        return AppColors.mediumGray;
    }
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 16),
        Text(
          number,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondaryDark),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
