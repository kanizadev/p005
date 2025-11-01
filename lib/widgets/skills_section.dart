import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'responsive_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 80,
        vertical: ResponsiveWidget.isMobile(context) ? 60 : 100,
      ),
      child: Column(
        children: [
          _buildSectionTitle(context, 'Skills & Technologies'),
          const SizedBox(height: 60),
          _buildSkillsGrid(context),
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
          textAlign: TextAlign.center,
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

  Widget _buildSkillsGrid(BuildContext context) {
    final skills = [
      {'name': 'Flutter', 'icon': FontAwesomeIcons.flutter, 'level': 0.95},
      {'name': 'Dart', 'icon': FontAwesomeIcons.dartLang, 'level': 0.90},
      {'name': 'HTML', 'icon': FontAwesomeIcons.html5, 'level': 0.90},
      {'name': 'CSS', 'icon': FontAwesomeIcons.css3Alt, 'level': 0.90},
      {'name': 'JavaScript', 'icon': FontAwesomeIcons.js, 'level': 0.85},

      {'name': 'Figma', 'icon': FontAwesomeIcons.figma, 'level': 0.95},

      {'name': 'Notion', 'icon': FontAwesomeIcons.notion, 'level': 0.85},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.isMobile(context)
            ? 2
            : ResponsiveWidget.isTablet(context)
            ? 3
            : 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return _buildSkillCard(
          context,
          skills[index]['name'] as String,
          skills[index]['icon'] as IconData,
          skills[index]['level'] as double,
        );
      },
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    String name,
    IconData icon,
    double level,
  ) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: level,
              backgroundColor: const Color(0xFF1C2321),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 5),
            Text(
              '${(level * 100).toInt()}%',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
