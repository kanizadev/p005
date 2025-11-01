import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'responsive_widget.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _downloadCV(BuildContext context) async {
    try {
      // Load the CV from assets
      final ByteData data = await rootBundle.load('assets/documents/cv.pdf');
      final List<int> bytes = data.buffer.asUint8List();

      // Get the download directory
      final Directory? downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
      } else if (Platform.isIOS) {
        downloadsDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadsDirectory = await getDownloadsDirectory();
      }

      if (downloadsDirectory == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not access downloads folder')),
          );
        }
        return;
      }

      // Create the file
      final String filePath = '${downloadsDirectory.path}/Kaniza_CV.pdf';
      final File file = File(filePath);
      await file.writeAsBytes(bytes);

      // Open the file
      final result = await OpenFilex.open(filePath);

      if (context.mounted) {
        if (result.type == ResultType.done ||
            result.type == ResultType.noAppToOpen) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('CV downloaded successfully!'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('CV saved to: $filePath'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error downloading CV: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isMobile(context) ? 20 : 80,
        vertical: ResponsiveWidget.isMobile(context) ? 60 : 120,
      ),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildTextContent(context)),
        const SizedBox(width: 80),
        _buildProfileImage(context, 350),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context, 250),
        const SizedBox(height: 40),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: ResponsiveWidget.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hi, I\'m',
          style: GoogleFonts.poppins(
            fontSize: ResponsiveWidget.isMobile(context) ? 20 : 24,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Kaniza',
          style: GoogleFonts.poppins(
            fontSize: ResponsiveWidget.isMobile(context) ? 40 : 64,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'I\'m a ',
              style: GoogleFonts.poppins(
                fontSize: ResponsiveWidget.isMobile(context) ? 20 : 28,
                color: Colors.grey[400],
              ),
            ),
            DefaultTextStyle(
              style: GoogleFonts.poppins(
                fontSize: ResponsiveWidget.isMobile(context) ? 20 : 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText('Mobile App Developer'),
                  TypewriterAnimatedText('Website Developer'),
                  TypewriterAnimatedText('Graphic Designer'),
                  TypewriterAnimatedText('UI/UX Designer'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'When I\'m not coding, you\'ll find me sketching ideas in Figma,\ncreating visuals in Photoshop or Illustrator, or organizing\nmy life in Notion.',
          style: GoogleFonts.poppins(
            fontSize: ResponsiveWidget.isMobile(context) ? 14 : 18,
            color: Colors.grey[400],
            height: 1.6,
          ),
          textAlign: ResponsiveWidget.isMobile(context)
              ? TextAlign.center
              : TextAlign.left,
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () => _downloadCV(context),
              icon: const Icon(Icons.download),
              label: const Text('Download CV'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(width: 20),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mail),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.github,
              'https://github.com/kanizadev',
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              FontAwesomeIcons.linkedin,
              'https://linkedin.com/in/kanizadev',
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              FontAwesomeIcons.twitter,
              'https://twitter.com/kanizadev',
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              FontAwesomeIcons.instagram,
              'https://instagram.com/kanizadev',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF2A3330),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile_picture.jpg',
            width: size - 8,
            height: size - 8,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback to icon if image not found
              return Icon(
                Icons.person,
                size: size * 0.5,
                color: const Color(0xFF6B9468),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF6B9468)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: FaIcon(icon, size: 20, color: const Color(0xFF9EC49B)),
      ),
    );
  }
}
