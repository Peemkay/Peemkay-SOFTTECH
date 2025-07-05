/// About Preview Section for Home Page
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class AboutPreview extends ConsumerWidget {
  const AboutPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: isMobile ? 64 : 100,
      ),
      child: ResponsiveRowColumn(
        layout: isMobile || isTablet
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: isMobile || isTablet
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    'About ${AppConstants.companyName}',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    textAlign: isMobile || isTablet
                        ? TextAlign.center
                        : TextAlign.left,
                  ).animate().slideX(begin: -0.3).fadeIn(),

                  const SizedBox(height: 24),

                  Text(
                    '${AppConstants.companyName} specializes in creating comprehensive digital solutions for diverse industries including military, banking, transportation, restaurants, e-commerce, education, and more.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondaryDark,
                      height: 1.6,
                    ),
                    textAlign: isMobile || isTablet
                        ? TextAlign.center
                        : TextAlign.left,
                  ).animate().slideX(begin: -0.3, delay: 200.ms).fadeIn(),

                  const SizedBox(height: 32),

                  // Key Points
                  Column(
                    children: [
                      _AboutPoint(
                        icon: FontAwesomeIcons.trophy,
                        title: '5+ Years Experience',
                        description:
                            'Proven track record in software development',
                        delay: 400.ms,
                      ),
                      const SizedBox(height: 16),
                      _AboutPoint(
                        icon: FontAwesomeIcons.users,
                        title: '100+ Projects Delivered',
                        description:
                            'Successful solutions for diverse organizations',
                        delay: 600.ms,
                      ),
                      const SizedBox(height: 16),
                      _AboutPoint(
                        icon: FontAwesomeIcons.industry,
                        title: '12+ Industries Served',
                        description:
                            'From military to education, we cover it all',
                        delay: 800.ms,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Learn More Button
                  ElevatedButton.icon(
                    onPressed: () => context.go('/about'),
                    icon: const Icon(FontAwesomeIcons.user, size: 16),
                    label: const Text('Learn More About Us'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).animate().scale(delay: 1000.ms).fadeIn(),
                ],
              ),
            ),
          ),

          if (!isMobile && !isTablet) ...[
            ResponsiveRowColumnItem(child: const SizedBox(width: 64)),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    // Stats Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                        _StatCard(
                          number: '100+',
                          label: 'Projects\nCompleted',
                          icon: FontAwesomeIcons.projectDiagram,
                          gradient: AppColors.primaryGradient,
                          delay: 600.ms,
                        ),
                        _StatCard(
                          number: '50+',
                          label: 'Happy\nClients',
                          icon: FontAwesomeIcons.handshake,
                          gradient: AppColors.secondaryGradient,
                          delay: 800.ms,
                        ),
                        _StatCard(
                          number: '5+',
                          label: 'Years\nExperience',
                          icon: FontAwesomeIcons.calendar,
                          gradient: AppColors.accentGradient,
                          delay: 1000.ms,
                        ),
                        _StatCard(
                          number: '25+',
                          label: 'Technologies\nMastered',
                          icon: FontAwesomeIcons.cogs,
                          gradient: LinearGradient(
                            colors: [AppColors.success, AppColors.warning],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          delay: 1200.ms,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AboutPoint extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Duration delay;

  const _AboutPoint({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().slideX(begin: -0.3, delay: delay).fadeIn();
  }
}

class _StatCard extends StatefulWidget {
  final String number;
  final String label;
  final IconData icon;
  final LinearGradient gradient;
  final Duration delay;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
    required this.gradient,
    required this.delay,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.gradient.colors.first.withOpacity(0.3),
                blurRadius: _isHovered ? 15 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.white, size: 24),
              const SizedBox(height: 12),
              Text(
                widget.number,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ).animate().scale(delay: widget.delay).fadeIn();
  }
}
