/// Modern Navigation Bar for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import 'themed_logo.dart';

class AppNavbar extends ConsumerStatefulWidget {
  const AppNavbar({super.key});

  @override
  ConsumerState<AppNavbar> createState() => _AppNavbarState();
}

class _AppNavbarState extends ConsumerState<AppNavbar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final currentRoute = GoRouterState.of(context).uri.path;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        gradient: AppColors.blackCardGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and Company Name
              InkWell(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    const TomatoLogo(size: 40, borderRadius: 8),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.companyName,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                        ),
                        // if (!isMobile)
                        //   Text(
                        //     'by ${AppConstants.founderName}',
                        //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        //       color: AppColors.textSecondaryLight,
                        //     ),
                        //   ),
                      ],
                    ),
                  ],
                ),
              ).animate().slideX(begin: -0.3).fadeIn(),

              // Desktop Navigation
              if (!isMobile) ...[
                Row(
                  children: AppConstants.navigationItems.map((item) {
                    final route = item == 'Home'
                        ? '/'
                        : '/${item.toLowerCase()}';
                    final isActive = currentRoute == route;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextButton(
                        onPressed: () => context.go(route),
                        style: TextButton.styleFrom(
                          foregroundColor: isActive
                              ? AppColors.primary
                              : AppColors.textSecondaryDark,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ).animate().slideX(begin: 0.3).fadeIn(),

                const SizedBox(width: 16),

                // CTA Button
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Get Started'),
                ).animate().scale().fadeIn(delay: 200.ms),
              ],

              // Mobile Menu Button
              if (isMobile)
                IconButton(
                  onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                  icon: Icon(
                    _isMenuOpen ? Icons.close : Icons.menu,
                    color: AppColors.primary,
                  ),
                ).animate().scale().fadeIn(),
            ],
          ),

          // Mobile Navigation Menu
          if (isMobile && _isMenuOpen)
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ...AppConstants.navigationItems.map((item) {
                    final route = item == 'Home'
                        ? '/'
                        : '/${item.toLowerCase()}';
                    final isActive = currentRoute == route;

                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: TextButton(
                        onPressed: () {
                          context.go(route);
                          setState(() => _isMenuOpen = false);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: isActive
                              ? AppColors.primary
                              : AppColors.textSecondaryDark,
                          backgroundColor: isActive
                              ? AppColors.primary.withValues(alpha: 0.1)
                              : null,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 8),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/contact');
                        setState(() => _isMenuOpen = false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),
                ],
              ),
            ).animate().slideY(begin: -0.3).fadeIn(),
        ],
      ),
    );
  }
}
