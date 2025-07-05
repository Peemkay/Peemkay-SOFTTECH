/// Glass Morphism Container Widget for Beautiful UI Effects
library;

import 'package:flutter/material.dart';
import 'dart:ui';
import '../constants/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double blur;
  final double opacity;
  final Color? color;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final bool enableShadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height = double.infinity,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = 10.0,
    this.opacity = 0.1,
    this.color,
    this.border,
    this.boxShadow,
    this.gradient,
    this.enableShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: enableShadow ? (boxShadow ?? _defaultShadow()) : null,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: gradient ?? _defaultGradient(),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              border: border ?? _defaultBorder(),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  List<BoxShadow> _defaultShadow() {
    return [
      BoxShadow(
        color: AppColors.primary.withValues(alpha: 0.1),
        blurRadius: 20,
        offset: const Offset(0, 8),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 40,
        offset: const Offset(0, 16),
        spreadRadius: 0,
      ),
    ];
  }

  Gradient _defaultGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        (color ?? Colors.white).withValues(alpha: opacity),
        (color ?? Colors.white).withValues(alpha: opacity * 0.5),
      ],
    );
  }

  Border _defaultBorder() {
    return Border.all(
      color: Colors.white.withValues(alpha: 0.2),
      width: 1,
    );
  }
}

class ShinyGlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool enableHover;

  const ShinyGlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    this.enableHover = true,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: onTap,
          child: GlassContainer(
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            padding: padding ?? const EdgeInsets.all(24),
            margin: margin,
            borderRadius: BorderRadius.circular(20),
            blur: 15,
            opacity: 0.15,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.2),
                Colors.white.withValues(alpha: 0.05),
                AppColors.primary.withValues(alpha: 0.1),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 25,
                offset: const Offset(0, 10),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 50,
                offset: const Offset(0, 20),
                spreadRadius: 0,
              ),
            ],
            child: child,
          ),
        ),
      ),
    );
  }
}

class GlowingGlassButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? glowColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const GlowingGlassButton({
    super.key,
    required this.child,
    this.onPressed,
    this.glowColor,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<GlowingGlassButton> createState() => _GlowingGlassButtonState();
}

class _GlowingGlassButtonState extends State<GlowingGlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _glowAnimation,
          builder: (context, child) {
            return Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: (widget.glowColor ?? AppColors.primary)
                        .withValues(alpha: _glowAnimation.value * 0.6),
                    blurRadius: _isHovered ? 30 : 20,
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                ],
              ),
              child: GlassContainer(
                padding: widget.padding ?? const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                borderRadius: BorderRadius.circular(16),
                blur: 20,
                opacity: 0.2,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: _isHovered ? 0.3 : 0.2),
                    (widget.glowColor ?? AppColors.primary)
                        .withValues(alpha: _isHovered ? 0.2 : 0.1),
                  ],
                ),
                border: Border.all(
                  color: (widget.glowColor ?? AppColors.primary)
                      .withValues(alpha: _isHovered ? 0.5 : 0.3),
                  width: _isHovered ? 2 : 1,
                ),
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FloatingGlassPanel extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const FloatingGlassPanel({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 40,
            offset: const Offset(0, 20),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 80,
            offset: const Offset(0, 40),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: padding ?? const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.25),
                  Colors.white.withValues(alpha: 0.1),
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.4),
                width: 2,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
