import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'responsive_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 80,
        vertical: ResponsiveWidget.isMobile(context) ? 60 : 100,
      ),
      child: Column(
        children: [
          _buildSectionTitle(context, 'Featured Projects'),
          const SizedBox(height: 60),
          _buildProjectsGrid(context),
        ],
      ),
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

  Widget _buildProjectsGrid(BuildContext context) {
    final projects = [
      {
        'title': 'p001',
        'description':
            'A beautiful, modern calculator app built with Flutter featuring a stunning sage green color scheme and glassmorphism design.',
        'technologies': ['Flutter', 'Dart'],
        'color': const Color(0xFF9EC49B),
        'codeUrl': 'https://github.com/kanizadev/p001',
      },
      {
        'title': 'p002',
        'description':
            'A sophisticated Flutter implementation of the classic Tic Tac Toe game with modern UI, AI opponents, multiple board sizes, timer challenges, and advanced features.',
        'technologies': ['Flutter', 'Dart'],
        'color': const Color(0xFFB8D4B5),
        'codeUrl': 'https://github.com/kanizadev/p002',
      },
      {
        'title': 'p003',
        'description':
            'A beautiful, modern weather application built with Flutter featuring real-time weather data, cute UI design, and comprehensive weather information.',
        'technologies': ['Flutter', 'Dart', 'OpenWeather API'],
        'color': const Color(0xFF7FA87C),
        'codeUrl': 'https://github.com/kanizadev/p003',
      },
      {
        'title': 'p004',
        'description':
            'A beautiful, modern Flutter application for calculating Body Mass Index (BMI) and body composition metrics with an elegant glassmorphism design and sage green color scheme.',
        'technologies': ['Flutter', 'Dart'],
        'color': const Color(0xFF6B9468),
        'codeUrl': 'https://github.com/kanizadev/p004',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.isMobile(context)
            ? 1
            : ResponsiveWidget.isTablet(context)
            ? 2
            : 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: ResponsiveWidget.isMobile(context) ? 0.95 : 0.80,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(
          context,
          projects[index]['title'] as String,
          projects[index]['description'] as String,
          projects[index]['technologies'] as List<String>,
          projects[index]['color'] as Color,
          projects[index]['codeUrl'] as String,
        );
      },
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> technologies,
    Color color,
    String codeUrl,
  ) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.phone_android, size: 40, color: color),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[400],
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    tech,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: codeUrl.isNotEmpty
                    ? () => _launchURL(codeUrl)
                    : null,
                icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                label: const Text('View Code'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey[400],
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
