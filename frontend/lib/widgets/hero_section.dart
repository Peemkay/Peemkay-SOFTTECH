/// Hero Section for Peemkay SOFTTECH Portfolio
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

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: isMobile ? 64 : 120,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.05),
            AppColors.secondary.withOpacity(0.05),
            AppColors.accent.withOpacity(0.05),
          ],
        ),
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
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: isMobile || isTablet
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // Greeting
                  Text(
                    'Hello, I\'m ${AppConstants.founderName} ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: isMobile || isTablet
                        ? TextAlign.center
                        : TextAlign.left,
                  ).animate().slideX(begin: -0.3).fadeIn(),

                  const SizedBox(height: 16),

                  // Main Headline
                  Text(
                    'Transforming Ideas into Digital Reality',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      color: AppColors.textPrimaryDark,
                    ),
                    textAlign: isMobile || isTablet
                        ? TextAlign.center
                        : TextAlign.left,
                  ).animate().slideX(begin: -0.3, delay: 200.ms).fadeIn(),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    AppConstants.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondaryDark,
                      height: 1.6,
                    ),
                    textAlign: isMobile || isTablet
                        ? TextAlign.center
                        : TextAlign.left,
                  ).animate().slideX(begin: -0.3, delay: 400.ms).fadeIn(),

                  const SizedBox(height: 40),

                  // Action Buttons
                  Wrap(
                    alignment: isMobile || isTablet
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/portfolio'),
                        icon: const Icon(FontAwesomeIcons.briefcase, size: 18),
                        label: const Text('View Portfolio'),
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
                      ).animate().scale(delay: 600.ms).fadeIn(),

                      OutlinedButton.icon(
                        onPressed: () => context.go('/contact'),
                        icon: const Icon(FontAwesomeIcons.envelope, size: 18),
                        label: const Text('Get In Touch'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).animate().scale(delay: 800.ms).fadeIn(),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Social Links
                  Row(
                    mainAxisAlignment: isMobile || isTablet
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      _SocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        color: AppColors.linkedin,
                        url: AppConstants.linkedinUrl,
                      ).animate().scale(delay: 1000.ms).fadeIn(),

                      const SizedBox(width: 16),

                      _SocialButton(
                        icon: FontAwesomeIcons.github,
                        color: AppColors.github,
                        url: AppConstants.githubUrl,
                      ).animate().scale(delay: 1200.ms).fadeIn(),

                      const SizedBox(width: 16),

                      _SocialButton(
                        icon: FontAwesomeIcons.twitter,
                        color: AppColors.twitter,
                        url: AppConstants.twitterUrl,
                      ).animate().scale(delay: 1400.ms).fadeIn(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          if (!isMobile && !isTablet) ...[
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    // Profile Photo
                    Container(
                          width: 320,
                          height: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 25,
                                offset: const Offset(0, 8),
                              ),
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.2),
                                blurRadius: 40,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(156),
                            child: Image.asset(
                              'assets/images/profile_photo.jpg',
                              width: 320,
                              height: 320,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback to icon if image fails to load
                                return Container(
                                  width: 320,
                                  height: 320,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.primary.withValues(
                                          alpha: 0.8,
                                        ),
                                        AppColors.accent.withValues(alpha: 0.8),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(156),
                                  ),
                                  child: const Icon(
                                    FontAwesomeIcons.user,
                                    size: 120,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                        .animate()
                        .scale(
                          delay: 600.ms,
                          duration: 800.ms,
                          curve: Curves.elasticOut,
                        )
                        .fadeIn(),

                    const SizedBox(height: 32),

                    // Tech Stack Icons
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children:
                          [
                                _TechIcon(
                                  FontAwesomeIcons.python,
                                  AppColors.python,
                                ),
                                _TechIcon(
                                  FontAwesomeIcons.flutter,
                                  AppColors.flutter,
                                ),
                                _TechIcon(
                                  FontAwesomeIcons.js,
                                  AppColors.javascript,
                                ),
                                _TechIcon(
                                  FontAwesomeIcons.react,
                                  AppColors.react,
                                ),
                                _TechIcon(
                                  FontAwesomeIcons.node,
                                  AppColors.node,
                                ),
                                _TechIcon(
                                  FontAwesomeIcons.database,
                                  AppColors.primary,
                                ),
                              ]
                              .map(
                                (widget) => widget
                                    .animate()
                                    .scale(
                                      delay: Duration(
                                        milliseconds: 800 + (16 * 50),
                                      ),
                                    )
                                    .fadeIn(),
                              )
                              .toList(),
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String url;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: color, size: 20),
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
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
