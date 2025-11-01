# 🎨 Kaniza's Personal Portfolio

A beautiful, modern, and responsive personal portfolio application built with Flutter. This portfolio showcases skills, projects, and provides a contact form for potential clients or employers.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)

## ✨ Features

- 🎨 **Modern Design** - Beautiful sage green color scheme with elegant gradients
- 📱 **Fully Responsive** - Optimized for mobile, tablet, and desktop screens
- 🔥 **Animated Sections** - Smooth transitions and animated text effects
- 👤 **About Section** - Personal story, experience, and interests
- 💻 **Skills Showcase** - Visual progress indicators for technologies
- 🚀 **Projects Section** - Featured projects with GitHub links
- 📬 **Contact Form** - Working contact form with validation
- 🌐 **Social Media Integration** - Direct links to GitHub, LinkedIn, Twitter, Instagram
- 📄 **CV Download** - Downloadable resume/CV functionality

## 🛠️ Technologies Used

- **Flutter** - Cross-platform app framework
- **Google Fonts** - Beautiful typography (Poppins & Source Code Pro)
- **Font Awesome Flutter** - Professional icons
- **Animated Text Kit** - Typewriter text animations
- **URL Launcher** - Handle external links and emails
- **Path Provider** - File system access for CV download
- **Open FileX** - Open downloaded files

## 📸 Screenshots

The portfolio includes:
- Hero section with animated text and profile picture
- About me section with personal info
- Skills showcase with 12+ technologies
- 4 featured project cards
- Contact form with validation
- Social media integration

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/kanizadev/p005.git
cd p005
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Add your assets**
   - Place your profile picture in `assets/images/profile_picture.jpg` (or .png)
   - Place your CV in `assets/documents/cv.pdf`

4. **Run the app**
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point and theme
├── screens/
│   └── home_screen.dart         # Main portfolio screen
└── widgets/
    ├── responsive_widget.dart   # Responsive layout helper
    ├── custom_app_bar.dart      # Navigation bar
    ├── hero_section.dart        # Hero/intro section
    ├── about_section.dart       # About me section
    ├── skills_section.dart      # Skills showcase
    ├── projects_section.dart    # Project cards
    └── contact_section.dart     # Contact form

assets/
├── images/
│   └── profile_picture.jpg      # Your profile picture
└── documents/
    └── cv.pdf                   # Your CV/resume
```

## 🎨 Customization

### Personal Information

1. **Update Hero Section** (`lib/widgets/hero_section.dart`):
   - Change name, roles, and tagline
   - Update social media links
   - Modify profile picture path

2. **Update About Section** (`lib/widgets/about_section.dart`):
   - Edit bio and description
   - Modify experience numbers
   - Update interests/tags

3. **Update Skills** (`lib/widgets/skills_section.dart`):
   - Add/remove technologies
   - Adjust skill levels
   - Update icons

4. **Update Projects** (`lib/widgets/projects_section.dart`):
   - Replace with your actual projects
   - Add GitHub repository links
   - Update descriptions and tech stacks

5. **Update Contact Info** (`lib/widgets/contact_section.dart`):
   - Update email address
   - Change phone number
   - Modify location

6. **Theme Colors** (`lib/main.dart`):
   - Customize primary color (sage green: #9EC49B)
   - Adjust secondary color (lighter sage: #B8D4B5)
   - Modify background colors

### Assets

- **Profile Picture**: `assets/images/profile_picture.jpg` (or .png)
- **CV/Resume**: `assets/documents/cv.pdf`

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  url_launcher: ^6.3.1
  font_awesome_flutter: ^10.7.0
  animated_text_kit: ^4.2.2
  path_provider: ^2.1.5
  open_filex: ^4.7.0
```

## 🏗️ Build for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop (Windows/macOS/Linux)
```bash
flutter build windows
flutter build macos
flutter build linux
```

## 🌐 Deployment

### Web Deployment
- **Firebase Hosting**: `firebase deploy --only hosting`
- **Netlify**: Connect your GitHub repo
- **Vercel**: Connect your GitHub repo
- **GitHub Pages**: Use `flutter build web` and deploy the `build/web` folder

### Mobile Deployment
- **Android**: Upload APK/AAB to Google Play Console
- **iOS**: Upload to App Store Connect via Xcode

## 👤 About

**Kaniza** - Mobile App & Website Developer | Graphic Designer

- 📧 Email: kanizakasfia@gmail.com
- 📱 Phone: +8801710960996
- 📍 Location: Bashundhara R/A, Dhaka, Bangladesh
- 💼 GitHub: [@kanizadev](https://github.com/kanizadev)
- 💼 LinkedIn: [kanizadev](https://linkedin.com/in/kanizadev)
- 🐦 Twitter: [@kanizadev](https://twitter.com/kanizadev)
- 📷 Instagram: [@kanizadev](https://instagram.com/kanizadev)

## 🎯 Skills

- **Mobile Development**: Flutter, Dart
- **Web Development**: HTML, CSS, JavaScript, TypeScript
- **Design Tools**: Figma, Photoshop, Illustrator
- **Other**: Firebase, Git, UI/UX Design, Notion

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Built with [Flutter](https://flutter.dev/)
- Icons from [Font Awesome](https://fontawesome.com/)
- Fonts from [Google Fonts](https://fonts.google.com/)

## ⭐ Show Your Support

If you like this project, please give it a ⭐ on GitHub!

---

**Built with ❤️ by Kaniza using Flutter**
