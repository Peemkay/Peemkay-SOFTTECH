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
  bool _isSubmitting = false;

  final List<String> _projectTypes = [
    'Mobile App Development',
    'Web Application',
    'Desktop Application',
    'Enterprise Solutions',
    'E-commerce Platform',
    'API Development',
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
    'Let\'s Discuss',
  ];

  final List<String> _timelines = [
    '1-2 weeks',
    '1-2 months',
    '3-6 months',
    '6-12 months',
    'Over 1 year',
    'Flexible',
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
      body: Stack(
        children: [
          // Animated Background Layer
          Positioned.fill(
            child: AnimatedBackground(
              key: const ValueKey('contact_background'),
              enableParticles: true,
              enableGradientShift: true,
              enableFloatingElements: !isMobile,
              child: Container(), // Empty container for background only
            ),
          ),

          // Content Layer
          Positioned.fill(
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
                      columnCrossAxisAlignment: CrossAxisAlignment.stretch,
                      rowCrossAxisAlignment: CrossAxisAlignment.start,
                      columnMainAxisSize: MainAxisSize.min,
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
                            child: _buildContactForm(
                              context,
                              isMobile,
                              isTablet,
                            ),
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
        ],
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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withValues(alpha: 0.3), Colors.transparent],
        ),
      ),
      child: Column(
        children: [
          // Main Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              'Let\'s Build Something Amazing Together',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ).animate().slideY(begin: 0.3).fadeIn(),

          const SizedBox(height: 24),

          // Subtitle
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Ready to transform your ideas into powerful digital solutions? '
              'Get in touch with Peemkay SOFTTECH and let\'s discuss your next project.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                height: 1.6,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
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
        _buildStatItem(context, '24h', 'Response Time', FontAwesomeIcons.clock),
        _buildStatItem(
          context,
          '50+',
          'Projects Delivered',
          FontAwesomeIcons.circleCheck,
        ),
        _buildStatItem(
          context,
          '100%',
          'Client Satisfaction',
          FontAwesomeIcons.star,
        ),
        _buildStatItem(
          context,
          '5+',
          'Years Experience',
          FontAwesomeIcons.award,
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
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 12),
        Text(
          number,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondaryDark),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          'Get In Touch',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ready to start your project? Contact us today!',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondaryDark),
        ),
        const SizedBox(height: 32),

        // Contact Methods
        _buildContactMethod(
          context,
          FontAwesomeIcons.envelope,
          'Email Us',
          AppConstants.email,
          AppColors.primary,
          () => _launchEmail(),
        ),
        const SizedBox(height: 24),
        _buildContactMethod(
          context,
          FontAwesomeIcons.phone,
          'Call Us',
          AppConstants.phone,
          AppColors.accent,
          () => _launchPhone(),
        ),
        const SizedBox(height: 24),
        _buildContactMethod(
          context,
          FontAwesomeIcons.locationDot,
          'Visit Us',
          AppConstants.address,
          AppColors.accentDark,
          null,
        ),
        const SizedBox(height: 32),

        // Social Media
        Text(
          'Follow Us',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryDark,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(FontAwesomeIcons.linkedin, AppColors.linkedin),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.github, AppColors.github),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.twitter, AppColors.twitter),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.instagram, AppColors.instagram),
          ],
        ),
      ],
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }

  Widget _buildContactForm(BuildContext context, bool isMobile, bool isTablet) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form Title
          Text(
            'Start Your Project',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tell us about your project and we\'ll get back to you within 24 hours.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondaryDark,
            ),
          ),
          const SizedBox(height: 32),

          // Personal Information
          _buildSectionHeader('Personal Information'),
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
                  label: 'Full Name *',
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
                  label: 'Email Address *',
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

          // Project Details
          _buildSectionHeader('Project Details'),
          const SizedBox(height: 16),

          // Project Type and Budget Row
          ResponsiveRowColumn(
            layout: isMobile
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            columnSpacing: 16,
            rowSpacing: 16,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _buildDropdownField(
                  label: 'Project Type *',
                  hint: 'Select project type',
                  value: _selectedProjectType,
                  items: _projectTypes,
                  onChanged: (value) =>
                      setState(() => _selectedProjectType = value),
                  icon: FontAwesomeIcons.laptop,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _buildDropdownField(
                  label: 'Budget Range',
                  hint: 'Select budget range',
                  value: _selectedBudget,
                  items: _budgetRanges,
                  onChanged: (value) => setState(() => _selectedBudget = value),
                  icon: FontAwesomeIcons.dollarSign,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Timeline
          _buildDropdownField(
            label: 'Project Timeline',
            hint: 'Select expected timeline',
            value: _selectedTimeline,
            items: _timelines,
            onChanged: (value) => setState(() => _selectedTimeline = value),
            icon: FontAwesomeIcons.calendar,
          ),
          const SizedBox(height: 24),

          // Project Description
          _buildSectionHeader('Project Description'),
          const SizedBox(height: 16),
          _buildTextFormField(
            controller: _messageController,
            label: 'Project Details *',
            hint:
                'Describe your project requirements, goals, and any specific features you need...',
            icon: FontAwesomeIcons.message,
            maxLines: 6,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please describe your project';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: GlowingGlassButton(
              onPressed: _isSubmitting ? null : _submitForm,
              glowColor: AppColors.primary,
              height: 56,
              child: _isSubmitting
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Sending...',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Send Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
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
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.textPrimaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          maxLines: maxLines,
          style: TextStyle(color: AppColors.textPrimaryDark),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textSecondaryDark),
            prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
            filled: true,
            fillColor: AppColors.cardDark.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.textPrimaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          style: TextStyle(color: AppColors.textPrimaryDark),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textSecondaryDark),
            prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
            filled: true,
            fillColor: AppColors.cardDark.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          dropdownColor: AppColors.cardDark,
        ),
      ],
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedProjectType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a project type'),
          backgroundColor: AppColors.error,
        ),
      );
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
                Icon(FontAwesomeIcons.circleCheck, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Thank you! Your message has been sent successfully. We\'ll get back to you within 24 hours.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 5),
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
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(FontAwesomeIcons.triangleExclamation, color: Colors.white),
                const SizedBox(width: 12),
                Text('Failed to send message. Please try again.'),
              ],
            ),
            backgroundColor: AppColors.error,
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
    final emailUri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      query: 'subject=Project Inquiry&body=Hello Peemkay SOFTTECH,',
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch email client'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _launchPhone() async {
    final phoneUri = Uri(scheme: 'tel', path: AppConstants.phone);

    try {
      await launchUrl(phoneUri);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch phone dialer'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
