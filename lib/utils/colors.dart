// 🎨 Academic Planner Color Scheme
// Gold/Bronze Honors theme with program-specific colors

import 'package:flutter/material.dart';

class AppColors {
  // 🏆 HONORS COLORS - Gold/Bronze Theme
  static const Color honorsGold = Color(0xFFD4AF37);        // Bright Academic Gold
  static const Color honorsBronze = Color(0xFFCD7F32);      // Rich Bronze
  static const Color honorsAccent = Color(0xFFB8860B);      // Dark Golden Rod
  static const Color honorsLight = Color(0xFFF7E98E);       // Light Gold
  static const Color honorsDark = Color(0xFF8B6914);        // Dark Gold

  // 🔵 POLITICAL SCIENCE MAJOR - Blue Theme
  static const Color majorPrimary = Color(0xFF1E3A8A);      // Deep Blue
  static const Color majorSecondary = Color(0xFF3B82F6);    // Bright Blue
  static const Color majorLight = Color(0xFFDBEAFE);        // Light Blue
  static const Color majorAccent = Color(0xFF1D4ED8);       // Medium Blue

  // 🟢 CODE MINOR - Green Theme
  static const Color minorPrimary = Color(0xFF059669);      // Emerald Green
  static const Color minorSecondary = Color(0xFF10B981);    // Bright Green
  static const Color minorLight = Color(0xFFD1FAE5);        // Light Green
  static const Color minorAccent = Color(0xFF047857);       // Dark Green

  // 🟠 TECH & LAW CERTIFICATE - Orange Theme
  static const Color certPrimary = Color(0xFFEA580C);       // Deep Orange
  static const Color certSecondary = Color(0xFFF97316);     // Bright Orange
  static const Color certLight = Color(0xFFFED7AA);         // Light Orange
  static const Color certAccent = Color(0xFFC2410C);        // Dark Orange

  // 🔴 WARNINGS & ALERTS
  static const Color errorRed = Color(0xFFDC2626);          // Bright Red
  static const Color warningAmber = Color(0xFFF59E0B);      // Warning Amber
  static const Color successGreen = Color(0xFF16A34A);      // Success Green
  static const Color infoBlue = Color(0xFF0EA5E9);          // Info Blue

  // 🌓 NEUTRAL COLORS
  static const Color primaryDark = Color(0xFF1F2937);       // Dark Gray
  static const Color primaryLight = Color(0xFFFAFAFA);      // Light Gray
  static const Color textPrimary = Color(0xFF111827);       // Almost Black
  static const Color textSecondary = Color(0xFF6B7280);     // Medium Gray
  static const Color textLight = Color(0xFF9CA3AF);         // Light Gray
  static const Color background = Color(0xFFF9FAFB);        // Off White
  static const Color surface = Color(0xFFFFFFFF);           // Pure White
  static const Color divider = Color(0xFFE5E7EB);           // Light Border

  // 📊 PROGRESS & STATUS COLORS
  static const Color completed = Color(0xFF16A34A);         // Green - Completed
  static const Color inProgress = Color(0xFF0EA5E9);        // Blue - In Progress
  static const Color notStarted = Color(0xFF6B7280);        // Gray - Not Started
  static const Color onTrack = Color(0xFF16A34A);           // Green - On Track
  static const Color behindSchedule = Color(0xFFF59E0B);    // Amber - Behind
  static const Color offTrack = Color(0xFFDC2626);          // Red - Off Track

  // 🎓 GPA COLORS
  static const Color gpaExcellent = Color(0xFF16A34A);      // 3.7+ (Green)
  static const Color gpaGood = Color(0xFF0EA5E9);           // 3.0-3.6 (Blue)
  static const Color gpaFair = Color(0xFFF59E0B);           // 2.5-2.9 (Amber)
  static const Color gpaPoor = Color(0xFFDC2626);           // <2.5 (Red)

  // 📅 SEMESTER STATUS COLORS
  static const Color semesterCompleted = Color(0xFF7C3AED); // Purple - Completed
  static const Color semesterCurrent = Color(0xFF0EA5E9);   // Blue - Current
  static const Color semesterUpcoming = Color(0xFF6B7280);  // Gray - Upcoming

  // 🎯 REQUIREMENT OVERLAP INDICATORS
  static const Color overlapDouble = Color(0xFF8B5CF6);     // Purple - 2 requirements
  static const Color overlapTriple = Color(0xFFEF4444);     // Red - 3+ requirements
  static const Color prerequisiteMet = Color(0xFF10B981);   // Green - Prerequisites met
  static const Color prerequisiteNeeded = Color(0xFFF59E0B); // Amber - Prerequisites needed

  // 📱 GRADIENT COMBINATIONS
  static const LinearGradient honorsGradient = LinearGradient(
    colors: [honorsGold, honorsBronze],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient majorGradient = LinearGradient(
    colors: [majorPrimary, majorSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient minorGradient = LinearGradient(
    colors: [minorPrimary, minorSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient certGradient = LinearGradient(
    colors: [certPrimary, certSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 🎨 HELPER METHODS
  static Color getCourseColor(String category) {
    switch (category.toLowerCase()) {
      case 'major':
      case 'major core':
      case 'major area a':
      case 'major area b':
      case 'major area c':
      case 'major elective':
        return majorPrimary;
      case 'code minor':
      case 'minor':
        return minorPrimary;
      case 'certificate':
      case 'tech law cert':
      case 'tech & law certificate':
        return certPrimary;
      case 'honors':
        return honorsGold;
      default:
        return textSecondary;
    }
  }

  static LinearGradient getCourseGradient(String category) {
    switch (category.toLowerCase()) {
      case 'major':
      case 'major core':
      case 'major area a':
      case 'major area b':
      case 'major area c':
      case 'major elective':
        return majorGradient;
      case 'code minor':
      case 'minor':
        return minorGradient;
      case 'certificate':
      case 'tech law cert':
      case 'tech & law certificate':
        return certGradient;
      case 'honors':
        return honorsGradient;
      default:
        return const LinearGradient(colors: [textSecondary, textLight]);
    }
  }

  static Color getGpaColor(double gpa) {
    if (gpa >= 3.7) return gpaExcellent;
    if (gpa >= 3.0) return gpaGood;
    if (gpa >= 2.5) return gpaFair;
    return gpaPoor;
  }

  static Color getProgressColor(double percentage) {
    if (percentage >= 90) return completed;
    if (percentage >= 70) return onTrack;
    if (percentage >= 50) return behindSchedule;
    return offTrack;
  }

  // 🎭 THEME-SPECIFIC COLOR SCHEMES
  static const Map<String, Color> lightTheme = {
    'background': background,
    'surface': surface,
    'primary': primaryDark,
    'secondary': textSecondary,
    'accent': majorPrimary,
  };

  static const Map<String, Color> darkTheme = {
    'background': Color(0xFF111827),
    'surface': Color(0xFF1F2937),
    'primary': primaryLight,
    'secondary': Color(0xFF9CA3AF),
    'accent': majorSecondary,
  };
}