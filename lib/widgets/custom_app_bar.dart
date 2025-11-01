import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive_widget.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String) onNavigate;

  const CustomAppBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 80,
        vertical: 20,
      ),
      child: ResponsiveWidget(
        mobile: _buildMobileAppBar(context),
        desktop: _buildDesktopAppBar(context),
      ),
    );
  }

  Widget _buildDesktopAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '<Portfolio />',
          style: GoogleFonts.sourceCodePro(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Row(
          children: [
            _buildNavItem(context, 'Home', 'home'),
            const SizedBox(width: 30),
            _buildNavItem(context, 'About', 'about'),
            const SizedBox(width: 30),
            _buildNavItem(context, 'Skills', 'skills'),
            const SizedBox(width: 30),
            _buildNavItem(context, 'Projects', 'projects'),
            const SizedBox(width: 30),
            _buildNavItem(context, 'Contact', 'contact'),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '<Portfolio />',
          style: GoogleFonts.sourceCodePro(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _showMobileMenu(context);
          },
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String section) {
    return InkWell(
      onTap: () => onNavigate(section),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate('home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate('about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Skills'),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate('skills');
                },
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Projects'),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate('projects');
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate('contact');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
