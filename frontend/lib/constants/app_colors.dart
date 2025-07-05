/// Color constants for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors - Black & Tomato Theme
  static const Color primary = Color(0xFFFF6347); // Tomato
  static const Color primaryDark = Color(0xFFDC143C); // Crimson
  static const Color primaryLight = Color(0xFFFF7F7F); // Light Coral

  // Secondary Colors - Black Shades
  static const Color secondary = Color(0xFF1A1A1A); // Rich Black
  static const Color secondaryDark = Color(0xFF0D1117); // GitHub Dark
  static const Color secondaryLight = Color(0xFF2D2D2D); // Charcoal

  // Accent Colors
  static const Color accent = Color(0xFFFF8C69); // Light Salmon
  static const Color accentDark = Color(0xFFCD5C5C); // Indian Red
  static const Color accentLight = Color(0xFFFFA07A); // Light Salmon

  // Success, Warning, Error
  static const Color success = Color(0xFF28A745); // Green
  static const Color warning = Color(0xFFFFC107); // Amber
  static const Color error = Color(0xFFDC3545); // Red

  // Additional Black Shades
  static const Color pureBlack = Color(0xFF000000);
  static const Color richBlack = Color(0xFF0D1117);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color darkGray = Color(0xFF2D2D2D);
  static const Color mediumGray = Color(0xFF404040);
  static const Color lightGray = Color(0xFF666666);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color gold = Color(0xFFFFD700);

  // Neutral Colors - Light Theme
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF404040);
  static const Color textTertiaryLight = Color(0xFF666666);
  static const Color borderLight = Color(0xFFE5E5E5);
  static const Color dividerLight = Color(0xFFF0F0F0);

  // Neutral Colors - Dark Theme
  static const Color backgroundDark = Color(0xFF0D1117);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color cardDark = Color(0xFF2D2D2D);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFC0C0C0);
  static const Color textTertiaryDark = Color(0xFF888888);
  static const Color borderDark = Color(0xFF404040);
  static const Color dividerDark = Color(0xFF2D2D2D);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [primary, primaryDark, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [richBlack, charcoal, darkGray],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient blackCardGradient = LinearGradient(
    colors: [charcoal, darkGray],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glass Effect Colors
  static const Color glassLight = Color(0x1AFFFFFF);
  static const Color glassDark = Color(0x1A000000);

  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x3A000000);

  // Social Media Brand Colors
  static const Color linkedin = Color(0xFF0077B5);
  static const Color github = Color(0xFF333333);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFE4405F);

  // Technology Colors
  static const Color flutter = Color(0xFF02569B);
  static const Color python = Color(0xFF3776AB);
  static const Color dart = Color(0xFF0175C2);
  static const Color javascript = Color(0xFFF7DF1E);
  static const Color react = Color(0xFF61DAFB);
  static const Color vue = Color(0xFF4FC08D);
  static const Color node = Color(0xFF339933);

  // Status Colors
  static const Color online = Color(0xFF10B981);
  static const Color offline = Color(0xFF6B7280);
  static const Color busy = Color(0xFFF59E0B);
  static const Color away = Color(0xFFEF4444);

  // Utility Methods
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
