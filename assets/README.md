# Assets Guide

## Profile Picture
- **Location:** `assets/images/profile_picture.png`
- **Recommended Format:** PNG or JPG
- **Recommended Size:** 500x500px or higher for best quality
- **Naming:** The file must be named exactly `profile_picture.png`
  - If using JPG format, update the filename in `lib/widgets/hero_section.dart` line 284

## CV/Resume
- **Location:** `assets/documents/cv.pdf`
- **Recommended Format:** PDF
- **Alternative Formats:** .doc, .docx (update filename in code if using)
- **Naming:** The file must be named exactly `cv.pdf`
  - If using a different format, update the filename in `lib/widgets/hero_section.dart` line 25

## How to Add Your Files

1. **Profile Picture:**
   - Place your profile picture in `assets/images/`
   - Name it `profile_picture.png` (or `.jpg` if preferred)
   - If using a different name or format, update line 284 in `lib/widgets/hero_section.dart`

2. **CV/Resume:**
   - Place your CV in `assets/documents/`
   - Name it `cv.pdf`
   - If using a different name or format, update line 25 in `lib/widgets/hero_section.dart`

3. **After adding files:**
   - Run `flutter pub get` (if needed)
   - Restart your app to see the changes

## Notes
- The profile picture will automatically fall back to an icon if the image is not found
- The CV download button will show an error message if the file is not found
- Make sure the file paths in the code match your actual file names

