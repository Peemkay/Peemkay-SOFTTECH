/// App constants for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';

class AppConstants {
  // Company Information
  static const String companyName = 'Peemkay SOFTTECH';
  static const String founderName = 'Peemkay';
  static const String tagline = 'Transforming Ideas into Digital Reality';
  static const String description =
      'We create powerful digital solutions that drive business growth across diverse industries. '
      'From military-grade security systems to user-friendly educational platforms, we deliver '
      'innovative websites, mobile apps, and desktop applications that exceed expectations and '
      'solve real-world challenges for organizations worldwide.';

  // Contact Information
  static const String email = 'ariepeemkay@gmail.com';
  static const String phone = '+2349113080869';
  static const String address =
      'Peemkay SOFTTECH, Dutsen Alhaji, Abuja, Nigeria';

  // Social Media
  static const String linkedinUrl = 'https://linkedin.com/in/peemkay';
  static const String githubUrl = 'https://github.com/peemkay';
  static const String twitterUrl = 'https://twitter.com/peemkay';
  static const String instagramUrl = 'https://instagram.com/peemkay_softtech';

  // API Configuration
  static const String baseApiUrl = 'http://127.0.0.1:8000/api/v1';
  static const String portfolioEndpoint = '/portfolio';
  static const String servicesEndpoint = '/services';
  static const String contactEndpoint = '/contact';

  // App Configuration
  static const String appVersion = '1.0.0';
  static const bool isDevelopment = true;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Responsive Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Spacing
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 24.0;

  // Navigation Menu Items
  static const List<String> navigationItems = [
    'Home',
    'Services',
    'Portfolio',
    'About',
    'Contact',
  ];

  // Service Categories
  static const List<String> serviceCategories = [
    'Mobile Development',
    'Web Development',
    'Desktop Development',
    'Backend Development',
    'AI/ML',
    'Design',
  ];

  // Technologies
  static const List<String> primaryTechnologies = [
    'Flutter',
    'Python',
    'Dart',
    'FastAPI',
    'PostgreSQL',
    'Firebase',
  ];

  static const List<String> allTechnologies = [
    'Flutter',
    'Python',
    'Dart',
    'FastAPI',
    'Django',
    'PostgreSQL',
    'MongoDB',
    'Redis',
    'Firebase',
    'React',
    'Vue.js',
    'Node.js',
    'Express',
    'TensorFlow',
    'PyTorch',
    'OpenAI API',
    'Docker',
    'Kubernetes',
    'AWS',
    'Git',
    'Figma',
    'Adobe XD',
    'Sketch',
  ];

  // Project Categories
  static const List<String> projectCategories = [
    'All',
    'Mobile App',
    'Web App',
    'Desktop App',
    'Enterprise',
    'AI/ML',
  ];

  // Industry Categories
  static const List<String> industryCategories = [
    'Military & Defense',
    'Banking & Finance',
    'Transportation & Ride Hailing',
    'Food & Restaurants',
    'E-commerce & Shopping',
    'Groceries & Delivery',
    'Business & Corporate',
    'Construction & Real Estate',
    'Education & Universities',
    'Healthcare',
    'Automotive & Car Rentals',
    'Government & Public Sector',
  ];

  // Contact Form Fields
  static const List<String> projectTypes = [
    'Mobile App Development',
    'Web Application Development',
    'Desktop Application Development',
    'API Development',
    'Database Design',
    'UI/UX Design',
    'Consulting',
    'Maintenance & Support',
    'Custom Software Solutions',
    'AI/ML Integration',
  ];

  static const List<String> budgetRanges = [
    'Under \$5,000',
    '\$5,000 - \$15,000',
    '\$15,000 - \$50,000',
    '\$50,000 - \$100,000',
    'Over \$100,000',
  ];

  static const List<String> timelines = [
    'Less than 1 month',
    '1-3 months',
    '3-6 months',
    '6-12 months',
    'Over 1 year',
  ];
}
