import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 80,
        vertical: ResponsiveWidget.isMobile(context) ? 60 : 100,
      ),
      child: Column(
        children: [
          _buildSectionTitle(context, 'About Me'),
          const SizedBox(height: 60),
          ResponsiveWidget(
            mobile: _buildMobileLayout(context),
            desktop: _buildDesktopLayout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildInfoCard(context)),
        const SizedBox(width: 40),
        Expanded(flex: 1, child: _buildAboutContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAboutContent(context),
        const SizedBox(height: 40),
        _buildInfoCard(context),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveWidget.isMobile(context) ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I\'m Kaniza',
          style: GoogleFonts.poppins(
            fontSize: ResponsiveWidget.isMobile(context) ? 20 : 24,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m a mobile app and website developer, as well as a graphic designer. I specialize in creating beautiful, functional, and user-centered digital experiences that combine the best of both development and design.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[400],
            height: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'When I\'m not coding, you\'ll find me sketching ideas in Figma, creating stunning visuals in Photoshop or Illustrator, or organizing my projects and life in Notion. I believe that great design and great code go hand in hand.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[400],
            height: 1.8,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildInterestChip(context, 'Mobile Development'),
            _buildInterestChip(context, 'Web Development'),
            _buildInterestChip(context, 'Graphic Design'),
            _buildInterestChip(context, 'UI/UX Design'),
            _buildInterestChip(context, 'Figma'),
            _buildInterestChip(context, 'Photoshop'),
            _buildInterestChip(context, 'Illustrator'),
            _buildInterestChip(context, 'Notion'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoRow(context, 'Experience', '3+ Years'),
            const Divider(height: 30),
            _buildInfoRow(context, 'Projects Completed', '50+'),
            const Divider(height: 30),
            _buildInfoRow(context, 'Technologies', '12+'),
            const Divider(height: 30),
            _buildInfoRow(context, 'Location', 'Bashundhara R/A, Dhaka'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[400]),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildInterestChip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: 0.1),
      side: BorderSide(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
      ),
      labelStyle: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
