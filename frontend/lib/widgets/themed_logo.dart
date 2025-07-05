import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum LogoTheme { tomato, black, transparent, gradient }

class ThemedLogo extends StatelessWidget {
  final double size;
  final LogoTheme theme;
  final double borderRadius;
  final bool showShadow;

  const ThemedLogo({
    super.key,
    this.size = 40,
    this.theme = LogoTheme.tomato,
    this.borderRadius = 8,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        gradient: theme == LogoTheme.gradient ? _getGradient() : null,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow ? _getShadow() : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          'assets/icons/app_logo.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                color: _getFallbackColor(),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Icon(
                Icons.business,
                color: Colors.white,
                size: size * 0.5,
              ),
            );
          },
        ),
      ),
    );
  }

  Color? _getBackgroundColor() {
    switch (theme) {
      case LogoTheme.tomato:
        return AppColors.primary;
      case LogoTheme.black:
        return Colors.black;
      case LogoTheme.transparent:
        return Colors.transparent;
      case LogoTheme.gradient:
        return null; // Use gradient instead
    }
  }

  Gradient? _getGradient() {
    if (theme == LogoTheme.gradient) {
      return AppColors.primaryGradient;
    }
    return null;
  }

  Color _getFallbackColor() {
    switch (theme) {
      case LogoTheme.tomato:
      case LogoTheme.gradient:
        return AppColors.primary;
      case LogoTheme.black:
        return Colors.black;
      case LogoTheme.transparent:
        return AppColors.primary;
    }
  }

  List<BoxShadow>? _getShadow() {
    if (!showShadow) return null;

    return [
      BoxShadow(
        color:
            _getBackgroundColor()?.withValues(alpha: 0.3) ??
            AppColors.primary.withValues(alpha: 0.3),
        blurRadius: 15,
        offset: const Offset(0, 5),
      ),
    ];
  }
}

// Convenience constructors for common use cases
class TomatoLogo extends StatelessWidget {
  final double size;
  final double borderRadius;
  final bool showShadow;

  const TomatoLogo({
    super.key,
    this.size = 40,
    this.borderRadius = 8,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedLogo(
      size: size,
      theme: LogoTheme.tomato,
      borderRadius: borderRadius,
      showShadow: showShadow,
    );
  }
}

class BlackLogo extends StatelessWidget {
  final double size;
  final double borderRadius;
  final bool showShadow;

  const BlackLogo({
    super.key,
    this.size = 40,
    this.borderRadius = 8,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedLogo(
      size: size,
      theme: LogoTheme.black,
      borderRadius: borderRadius,
      showShadow: showShadow,
    );
  }
}

class GradientLogo extends StatelessWidget {
  final double size;
  final double borderRadius;
  final bool showShadow;

  const GradientLogo({
    super.key,
    this.size = 40,
    this.borderRadius = 8,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemedLogo(
      size: size,
      theme: LogoTheme.gradient,
      borderRadius: borderRadius,
      showShadow: showShadow,
    );
  }
}
