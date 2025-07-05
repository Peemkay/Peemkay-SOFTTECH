/// Contact Preview Section for Home Page
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class ContactPreview extends ConsumerWidget {
  const ContactPreview({super.key});

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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.05),
            AppColors.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Text(
            'Ready to Start Your Project?',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.3).fadeIn(),

          const SizedBox(height: 16),

          Text(
            'Let\'s discuss your requirements and bring your vision to life',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondaryLight,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

          const SizedBox(height: 48),

          // Contact Options
          ResponsiveRowColumn(
            layout: isMobile 
                ? ResponsiveRowColumnType.COLUMN 
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            columnMainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResponsiveRowColumnItem(
                child: _ContactCard(
                  icon: FontAwesomeIcons.envelope,
                  title: 'Email Us',
                  subtitle: AppConstants.email,
                  color: AppColors.primary,
                  onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.email}')),
                  delay: 400.ms,
                ),
              ),
              
              ResponsiveRowColumnItem(
                child: _ContactCard(
                  icon: FontAwesomeIcons.phone,
                  title: 'Call Us',
                  subtitle: AppConstants.phone,
                  color: AppColors.secondary,
                  onTap: () => launchUrl(Uri.parse('tel:${AppConstants.phone}')),
                  delay: 600.ms,
                ),
              ),
              
              ResponsiveRowColumnItem(
                child: _ContactCard(
                  icon: FontAwesomeIcons.linkedin,
                  title: 'LinkedIn',
                  subtitle: 'Connect with us',
                  color: AppColors.linkedin,
                  onTap: () => launchUrl(Uri.parse(AppConstants.linkedinUrl)),
                  delay: 800.ms,
                ),
              ),
            ],
          ),

          const SizedBox(height: 48),

          // CTA Buttons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton.icon(
                onPressed: () => context.go('/contact'),
                icon: const Icon(FontAwesomeIcons.paperPlane, size: 16),
                label: const Text('Get Free Quote'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
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

              OutlinedButton.icon(
                onPressed: () => context.go('/portfolio'),
                icon: const Icon(FontAwesomeIcons.briefcase, size: 16),
                label: const Text('View Our Work'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).animate().scale(delay: 1200.ms).fadeIn(),
            ],
          ),

          const SizedBox(height: 32),

          // Industries Served
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Industries We Serve',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    'Military & Defense',
                    'Banking & Finance',
                    'Transportation',
                    'Restaurants',
                    'E-commerce',
                    'Education',
                    'Healthcare',
                    'Real Estate',
                    'Construction',
                    'Government',
                  ].map((industry) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        industry,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ).animate().slideY(begin: 0.3, delay: 1400.ms).fadeIn(),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  final Duration delay;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
    required this.delay,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppConstants.shortAnimation,
          transform: Matrix4.identity()
            ..scale(_isHovered ? 1.05 : 1.0),
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _isHovered 
                      ? widget.color.withOpacity(0.3)
                      : AppColors.shadowLight.withOpacity(0.1),
                  blurRadius: _isHovered ? 20 : 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: _isHovered 
                    ? widget.color.withOpacity(0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.color,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().slideY(begin: 0.3, delay: widget.delay).fadeIn();
  }
}
