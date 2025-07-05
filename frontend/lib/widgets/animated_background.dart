/// Animated Background Effects for Beautiful UI
library;

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constants/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool enableParticles;
  final bool enableGradientShift;
  final bool enableFloatingElements;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.enableParticles = true,
    this.enableGradientShift = true,
    this.enableFloatingElements = true,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _gradientController;
  late AnimationController _particleController;
  late AnimationController _floatingController;
  
  late Animation<double> _gradientAnimation;
  late Animation<double> _particleAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    
    _gradientController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    
    _particleController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    
    _floatingController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _gradientAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeInOut),
    );
    
    _particleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _particleController, curve: Curves.linear),
    );
    
    _floatingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    if (widget.enableGradientShift) {
      _gradientController.repeat(reverse: true);
    }
    
    if (widget.enableParticles) {
      _particleController.repeat();
    }
    
    if (widget.enableFloatingElements) {
      _floatingController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _particleController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated Gradient Background
        if (widget.enableGradientShift)
          AnimatedBuilder(
            animation: _gradientAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.backgroundDark,
                      Color.lerp(
                        AppColors.backgroundDark,
                        AppColors.primary.withValues(alpha: 0.1),
                        _gradientAnimation.value * 0.3,
                      )!,
                      AppColors.backgroundDark,
                    ],
                  ),
                ),
              );
            },
          ),

        // Floating Particles
        if (widget.enableParticles)
          AnimatedBuilder(
            animation: _particleAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: ParticlePainter(_particleAnimation.value),
                size: Size.infinite,
              );
            },
          ),

        // Floating Glass Elements
        if (widget.enableFloatingElements)
          AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: FloatingElementsPainter(_floatingAnimation.value),
                size: Size.infinite,
              );
            },
          ),

        // Main Content
        widget.child,
      ],
    );
  }
}

class ParticlePainter extends CustomPainter {
  final double animationValue;
  final List<Particle> particles = [];

  ParticlePainter(this.animationValue) {
    // Generate particles
    for (int i = 0; i < 50; i++) {
      particles.add(Particle(
        x: math.Random().nextDouble(),
        y: math.Random().nextDouble(),
        size: math.Random().nextDouble() * 3 + 1,
        speed: math.Random().nextDouble() * 0.5 + 0.1,
        opacity: math.Random().nextDouble() * 0.5 + 0.1,
      ));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      final x = (particle.x + animationValue * particle.speed) % 1.0 * size.width;
      final y = particle.y * size.height;
      
      paint.color = AppColors.primary.withValues(alpha: particle.opacity * 0.3);
      
      canvas.drawCircle(
        Offset(x, y),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class FloatingElementsPainter extends CustomPainter {
  final double animationValue;

  FloatingElementsPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw floating geometric shapes
    for (int i = 0; i < 8; i++) {
      final progress = (animationValue + i * 0.125) % 1.0;
      final x = size.width * 0.1 + (size.width * 0.8) * math.sin(progress * math.pi * 2);
      final y = size.height * 0.2 + (size.height * 0.6) * progress;
      final opacity = (1.0 - progress) * 0.2;
      
      paint.color = AppColors.primary.withValues(alpha: opacity);
      
      // Draw hexagon
      final path = Path();
      final radius = 20 + progress * 30;
      for (int j = 0; j < 6; j++) {
        final angle = j * math.pi / 3;
        final px = x + radius * math.cos(angle);
        final py = y + radius * math.sin(angle);
        if (j == 0) {
          path.moveTo(px, py);
        } else {
          path.lineTo(px, py);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}

class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;

  const ShimmerEffect({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.baseColor ?? Colors.grey.shade300,
                widget.highlightColor ?? Colors.white,
                widget.baseColor ?? Colors.grey.shade300,
              ],
              stops: [
                math.max(0.0, _animation.value - 0.3),
                _animation.value,
                math.min(1.0, _animation.value + 0.3),
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class GlowingOrb extends StatefulWidget {
  final double size;
  final Color color;
  final double intensity;

  const GlowingOrb({
    super.key,
    this.size = 100,
    this.color = Colors.blue,
    this.intensity = 1.0,
  });

  @override
  State<GlowingOrb> createState() => _GlowingOrbState();
}

class _GlowingOrbState extends State<GlowingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                widget.color.withValues(alpha: _animation.value * widget.intensity),
                widget.color.withValues(alpha: 0.1 * widget.intensity),
                Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: _animation.value * 0.5),
                blurRadius: widget.size * 0.5,
                spreadRadius: widget.size * 0.1,
              ),
            ],
          ),
        );
      },
    );
  }
}
