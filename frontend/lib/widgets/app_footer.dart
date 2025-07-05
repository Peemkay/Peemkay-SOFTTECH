/// App Footer for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import 'themed_logo.dart';

class AppFooter extends ConsumerWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.darkGradient,
        border: Border(
          top: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Main Footer Content
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 64,
              vertical: isMobile ? 40 : 60,
            ),
            child: ResponsiveRowColumn(
              layout: isMobile || isTablet
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnMainAxisAlignment: MainAxisAlignment.center,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Company Info
                ResponsiveRowColumnItem(
                  rowFlex: 2,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      crossAxisAlignment: isMobile || isTablet
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        // Logo and Company Name
                        Row(
                          mainAxisAlignment: isMobile || isTablet
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            const BlackLogo(size: 40, borderRadius: 8),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppConstants.companyName,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                                // Text(
                                //   'by ${AppConstants.founderName}',
                                //   style: Theme.of(context).textTheme.bodySmall
                                //       ?.copyWith(
                                //         color: AppColors.textSecondaryDark,
                                //       ),
                                // ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Description
                        Text(
                          AppConstants.tagline,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.textSecondaryDark,
                                height: 1.5,
                              ),
                          textAlign: isMobile || isTablet
                              ? TextAlign.center
                              : TextAlign.left,
                        ),

                        const SizedBox(height: 24),

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
                            ),
                            const SizedBox(width: 12),
                            _SocialButton(
                              icon: FontAwesomeIcons.github,
                              color: AppColors.github,
                              url: AppConstants.githubUrl,
                            ),
                            const SizedBox(width: 12),
                            _SocialButton(
                              icon: FontAwesomeIcons.twitter,
                              color: AppColors.twitter,
                              url: AppConstants.twitterUrl,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                if (isMobile || isTablet)
                  ResponsiveRowColumnItem(child: const SizedBox(height: 40)),

                // Quick Links
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: isMobile || isTablet
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Links',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 16),
                      ...AppConstants.navigationItems.map((item) {
                        final route = item == 'Home'
                            ? '/'
                            : '/${item.toLowerCase()}';
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: TextButton(
                            onPressed: () => context.go(route),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondaryDark,
                              padding: EdgeInsets.zero,
                              alignment: isMobile || isTablet
                                  ? Alignment.center
                                  : Alignment.centerLeft,
                            ),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),

                if (isMobile || isTablet)
                  ResponsiveRowColumnItem(child: const SizedBox(height: 40)),

                // Contact Info
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: isMobile || isTablet
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Info',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 16),
                      _ContactInfo(
                        icon: FontAwesomeIcons.envelope,
                        text: AppConstants.email,
                        onTap: () => launchUrl(
                          Uri.parse('mailto:${AppConstants.email}'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _ContactInfo(
                        icon: FontAwesomeIcons.phone,
                        text: AppConstants.phone,
                        onTap: () =>
                            launchUrl(Uri.parse('tel:${AppConstants.phone}')),
                      ),
                      const SizedBox(height: 8),
                      _ContactInfo(
                        icon: FontAwesomeIcons.mapMarkerAlt,
                        text: AppConstants.address,
                        onTap: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 64,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.borderDark.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
            ),
            child: ResponsiveRowColumn(
              layout: isMobile
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              columnMainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResponsiveRowColumnItem(
                  child: Text(
                    '© ${DateTime.now().year} ${AppConstants.companyName}. All rights reserved.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiaryDark,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                ),

                // if (isMobile)
                //   ResponsiveRowColumnItem(child: const SizedBox(height: 8)),

                // ResponsiveRowColumnItem(
                //   child: Text(
                //     'Made with ❤️ using Flutter & Python',
                //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //       color: AppColors.textTertiaryDark,
                //     ),
                //     textAlign: isMobile ? TextAlign.center : TextAlign.right,
                //   ),
                // ),
              ],
            ),
          ),
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
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ContactInfo({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary, size: 14),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
