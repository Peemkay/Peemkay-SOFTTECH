/// Professional Contact Screen for Peemkay SOFTTECH Portfolio
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/app_navbar.dart';
import '../widgets/app_footer.dart';
import '../widgets/glass_container.dart';
import '../widgets/animated_background.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _messageController = TextEditingController();

  String? _selectedProjectType;
  String? _selectedBudget;
  String? _selectedTimeline;
  String? _selectedIndustry;
  bool _isSubmitting = false;

  final List<String> _projectTypes = [
    'Mobile App Development',
    'Web Application',
    'Desktop Application',
    'API Development',
    'Database Design',
    'System Integration',
    'Consulting',
    'Other',
  ];

  final List<String> _budgetRanges = [
    'Under \$5,000',
    '\$5,000 - \$15,000',
    '\$15,000 - \$50,000',
    '\$50,000 - \$100,000',
    'Over \$100,000',
    'Discuss Budget',
  ];

  final List<String> _timelines = [
    'Less than 1 month',
    '1-3 months',
    '3-6 months',
    '6-12 months',
    'More than 1 year',
    'Flexible',
  ];

  final List<String> _industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'E-commerce',
    'Real Estate',
    'Manufacturing',
    'Government',
    'Non-profit',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: AnimatedBackground(
        enableParticles: true,
        enableGradientShift: true,
        enableFloatingElements: !isMobile,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Navigation Bar
              const AppNavbar(),

              // Hero Section
              _buildHeroSection(context, isMobile),

              // Contact Content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 32,
                  vertical: 32,
                ),
                child: ResponsiveRowColumn(
                  layout: isMobile
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                  columnSpacing: 32,
                  rowSpacing: 32,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: ShinyGlassCard(
                        child: _buildContactInfo(context, isMobile),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 2,
                      child: FloatingGlassPanel(
                        child: _buildContactForm(context, isMobile, isTablet),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: isMobile ? 32 : 64,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.backgroundDark,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Let\'s Build Something Amazing Together',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: isMobile ? 28 : 48,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.3).fadeIn(),

          const SizedBox(height: 16),

          Text(
            'Tell us about your project and we\'ll provide a customized solution that transforms your ideas into digital reality.',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textSecondaryDark,
              fontSize: isMobile ? 16 : 20,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: 0.2, delay: 200.ms).fadeIn(),

          const SizedBox(height: 32),

          // Quick Contact Stats
          if (!isMobile) _buildQuickStats(context),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(
          context,
          '50+',
          'Projects Completed',
          FontAwesomeIcons.diagramProject,
        ),
        _buildStatItem(
          context,
          '24/7',
          'Support Available',
          FontAwesomeIcons.headset,
        ),
        _buildStatItem(
          context,
          '100%',
          'Client Satisfaction',
          FontAwesomeIcons.star,
        ),
      ],
    ).animate().slideY(begin: 0.3, delay: 400.ms).fadeIn();
  }

  Widget _buildStatItem(
    BuildContext context,
    String number,
    String label,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          number,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondaryDark),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDark.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ready to start your project? Contact us through any of these channels.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondaryDark),
          ),
          const SizedBox(height: 24),

          // Contact Methods
          _buildContactMethod(
            context,
            FontAwesomeIcons.envelope,
            'Email Us',
            AppConstants.email,
            AppColors.primary,
            () => _launchEmail(),
          ),
          const SizedBox(height: 16),
          _buildContactMethod(
            context,
            FontAwesomeIcons.phone,
            'Call Us',
            AppConstants.phone,
            AppColors.secondary,
            () => _launchPhone(),
          ),
          const SizedBox(height: 16),
          _buildContactMethod(
            context,
            FontAwesomeIcons.locationDot,
            'Visit Us',
            'Dutsen Alhaji, Abuja, Nigeria',
            AppColors.accent,
            null,
          ),

          const SizedBox(height: 24),

          // Business Hours
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      color: AppColors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Business Hours',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Monday - Friday: 9:00 AM - 6:00 PM\nSaturday: 10:00 AM - 4:00 PM\nSunday: Closed',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondaryDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    VoidCallback? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimaryLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                color: color,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDark.withValues(alpha: 0.3)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Inquiry Form',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textPrimaryLight,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Fill out the form below and we\'ll get back to you within 24 hours.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondaryDark,
              ),
            ),
            const SizedBox(height: 24),

            // Personal Information Section
            _buildSectionHeader(context, 'Personal Information'),
            const SizedBox(height: 16),

            // Name and Email Row
            ResponsiveRowColumn(
              layout: isMobile
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              columnSpacing: 16,
              rowSpacing: 16,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildTextFormField(
                    controller: _nameController,
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    icon: FontAwesomeIcons.user,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildTextFormField(
                    controller: _emailController,
                    label: 'Email Address',
                    hint: 'Enter your email address',
                    icon: FontAwesomeIcons.envelope,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Phone and Company Row
            ResponsiveRowColumn(
              layout: isMobile
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              columnSpacing: 16,
              rowSpacing: 16,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildTextFormField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    icon: FontAwesomeIcons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildTextFormField(
                    controller: _companyController,
                    label: 'Company/Organization',
                    hint: 'Enter your company name',
                    icon: FontAwesomeIcons.building,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Project Description
            _buildSectionHeader(context, 'Project Description'),
            const SizedBox(height: 16),

            _buildTextFormField(
              controller: _messageController,
              label: 'Project Details',
              hint:
                  'Describe your project requirements, goals, and any specific features you need...',
              icon: FontAwesomeIcons.fileLines,
              maxLines: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please describe your project';
                }
                if (value.length < 20) {
                  return 'Please provide more details about your project';
                }
                return null;
              },
            ),

            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _submitForm,
                icon: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Icon(FontAwesomeIcons.paperPlane),
                label: Text(
                  _isSubmitting ? 'Sending...' : 'Send Project Inquiry',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Privacy Notice
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.shield,
                    color: AppColors.accent,
                    size: 16,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Your information is secure and will only be used to contact you about your project inquiry.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(color: AppColors.textPrimaryLight),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
        labelStyle: TextStyle(color: AppColors.textSecondaryDark),
        hintStyle: TextStyle(
          color: AppColors.textSecondaryDark.withValues(alpha: 0.7),
        ),
        filled: true,
        fillColor: AppColors.backgroundDark.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.borderDark.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(FontAwesomeIcons.circleCheck, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Message Sent Successfully!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'We\'ll get back to you within 24 hours.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );

        // Clear form
        _formKey.currentState!.reset();
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _companyController.clear();
        _messageController.clear();
        setState(() {
          _selectedProjectType = null;
          _selectedBudget = null;
          _selectedTimeline = null;
          _selectedIndustry = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.triangleExclamation,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text('Failed to send message. Please try again.'),
                ),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      query:
          'subject=Project Inquiry&body=Hello Peemkay SOFTTECH,\n\nI would like to discuss a project with you.\n\nBest regards,',
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not launch email client'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: AppConstants.phone);

    try {
      await launchUrl(phoneUri);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not launch phone dialer'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
