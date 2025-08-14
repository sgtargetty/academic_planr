// 🎓 Academic Planner - Simplified Main App Entry Point
// This version removes dependencies on files we haven't created yet

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 🎨 Theme & Styling
import 'utils/colors.dart';

// 📱 Screens
import 'screens/home/academic_home.dart';

// 📊 Data
import 'data/completed/summer_2025_completed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 📱 Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 🎨 Configure status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.surface,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const AcademicPlannerApp());
}

class AcademicPlannerApp extends StatelessWidget {
  const AcademicPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Planner',
      debugShowCheckedModeBanner: false,
      
      // 🎨 Theme Configuration
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.majorPrimary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.majorPrimary,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      
      // 🏠 Home Screen
      home: const AcademicHome(),
      
      // 📱 App Configuration
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0), // Prevent text scaling issues
          ),
          child: child!,
        );
      },
    );
  }
}