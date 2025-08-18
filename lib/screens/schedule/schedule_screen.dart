// 📅 Enhanced Interactive Schedule Screen with Smart Limits & Swap Feature
// Plan your semesters from Fall 2025 to Spring 2027

import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // ⚙️ SMART SEMESTER LIMITS SETTINGS
  bool _enforceMaxCredits = true;  // 15 credit limit
  bool _enforceMaxClasses = true;  // 5 class limit
  int _maxCreditsPerSemester = 15;
  int _maxClassesPerSemester = 5;

  String? _forecastToSemester;
  Map<String, String> _forecastedGrades = {}; // courseId -> grade
  bool _isForecasting = false;

  // 📚 Course Data - Your Corrected Academic Plan
  Map<String, List<PlannedCourse>> semesterCourses = {
    'Summer 2025': [
      // ✅ COMPLETED COURSES
      PlannedCourse(
        id: 'CPO3034',
        code: 'CPO 3034',
        title: 'Politics of Developing Areas',
        credits: 3,
        requirements: ['Major (Area B)'],
        isCompleted: true,
        grade: 'A',
      ),
      PlannedCourse(
        id: 'GEO3471',
        code: 'GEO 3471',
        title: 'World Political Geography',
        credits: 3,
        requirements: ['Major (Area C)'],
        isCompleted: true,
        grade: 'A-',
      ),
      PlannedCourse(
        id: 'PLA4410',
        code: 'PLA 4410',
        title: 'Intellectual Property Law',
        credits: 3,
        requirements: ['Major (Core)', 'Certificate'],
        isCompleted: true,
        grade: 'A',
      ),
      PlannedCourse(
        id: 'POS3424',
        code: 'POS 3424',
        title: 'Congress & Legislative Process',
        credits: 3,
        requirements: ['Major (Core)'],
        isCompleted: true,
        grade: 'A+',
      ),
    ],
    'Fall 2025': [
      PlannedCourse(
        id: 'CPO3103',
        code: 'CPO 3103',
        title: 'Comparative Politics',
        credits: 3,
        requirements: ['Major (Area A)'],
      ),
      PlannedCourse(
        id: 'PLA3108',
        code: 'PLA 3108',
        title: 'Legal Research',
        credits: 3,
        requirements: ['Major (Core)'],
      ),
      PlannedCourse(
        id: 'POS3413',
        code: 'POS 3413',
        title: 'The American Presidency',
        credits: 3,
        requirements: ['Major (Core)'],
      ),
      PlannedCourse(
        id: 'POS4284',
        code: 'POS 4284',
        title: 'Judicial Process & Politics',
        credits: 3,
        requirements: ['Major (Area A)'],
      ),
      PlannedCourse(
        id: 'PUP3204',
        code: 'PUP 3204',
        title: 'Sustainability',
        credits: 3,
        requirements: ['Major (Elective)'],
      ),
    ],
    'Spring 2026': [
      PlannedCourse(
        id: 'INR4074',
        code: 'INR 4074',
        title: 'Immigration Policy',
        credits: 3,
        requirements: ['Major (Elective)'],
      ),
      PlannedCourse(
        id: 'POS4941',
        code: 'POS 4941',
        title: 'Political Science Internship',
        credits: 3,
        requirements: ['Major (Elective)'],
      ),
      PlannedCourse(
        id: 'PLA4585',
        code: 'PLA 4585',
        title: 'Cybersecurity and the Law',
        credits: 3,
        requirements: ['Certificate'],
        isNewlyAdded: true, // Fixed course
      ),
      PlannedCourse(
        id: 'AMH3421',
        code: 'AMH 3421',
        title: 'American Legal History',
        credits: 3,
        requirements: ['Major (Elective)'],
      ),
      PlannedCourse(
        id: 'HONR1',
        code: 'HONR',
        title: 'Honors Requirement #1',
        credits: 3,
        requirements: ['Honors'],
      ),
    ],
    'Summer 2026': [
      PlannedCourse(
        id: 'POS3703',
        code: 'POS 3703',
        title: 'Scope and Methods of Pol Sci',
        credits: 3,
        requirements: ['Major (Core)'],
      ),
      PlannedCourse(
        id: 'COP2500C',
        code: 'COP 2500C',
        title: 'Concepts in Comp Sci',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
      PlannedCourse(
        id: 'COP3223C',
        code: 'COP 3223C',
        title: 'Intro to Programming in C',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
      PlannedCourse(
        id: 'POT4003',
        code: 'POT 4003',
        title: 'Political Theory',
        credits: 3,
        requirements: ['Major (Area C)'],
        isNewlyAdded: true, // Fixed course
      ),
    ],
    'Fall 2026': [
      PlannedCourse(
        id: 'POS4603',
        code: 'POS 4603',
        title: 'American Constitutional Law I',
        credits: 3,
        requirements: ['Major (Law Requirement)'],
        isNewlyAdded: true, // Fixed course
      ),
      PlannedCourse(
        id: 'COP3330',
        code: 'COP 3330',
        title: 'Object-Oriented Programming',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
      PlannedCourse(
        id: 'STA4241',
        code: 'STA 4241',
        title: 'Statistical Learning',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
      PlannedCourse(
        id: 'STA4364',
        code: 'STA 4364',
        title: 'Stat Foundations of Data Sci',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
      PlannedCourse(
        id: 'HONR3',
        code: 'HONR',
        title: 'Honors Requirement #3',
        credits: 3,
        requirements: ['Honors'],
      ),
    ],
    'Spring 2027': [
      PlannedCourse(
        id: 'POS4961',
        code: 'POS 4961',
        title: 'Exit Course (Capstone)',
        credits: 3,
        requirements: ['Major (Capstone)'],
        isCapstone: true,
      ),
      PlannedCourse(
        id: 'PLA3871',
        code: 'PLA 3871',
        title: 'Law and Technology',
        credits: 3,
        requirements: ['Certificate'],
      ),
      PlannedCourse(
        id: 'HIS3462',
        code: 'HIS 3462',
        title: 'History of Science',
        credits: 3,
        requirements: ['Certificate'],
      ),
      PlannedCourse(
        id: 'PHI3626',
        code: 'PHI 3626',
        title: 'Ethics in Science/Tech',
        credits: 3,
        requirements: ['Certificate'],
        isNewlyAdded: true, // Fixed course
      ),
      PlannedCourse(
        id: 'MAP4112',
        code: 'MAP 4112',
        title: 'ML & AI Foundations',
        credits: 3,
        requirements: ['CODE Minor'],
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSummaryHeader(),
          Expanded(
            child: _buildSemesterGrid(),
          ),
        ],
      ),
    );
  }

   AppBar _buildAppBar() {
    return AppBar(
      title: Text(_isForecasting ? 'Forecasting Mode' : 'Course Schedule'),
      backgroundColor: _isForecasting ? AppColors.infoBlue : AppColors.majorPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        if (_isForecasting)
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: _exitForecastMode,
            tooltip: 'Exit Forecast',
          )
        else
          IconButton(
            icon: const Icon(Icons.insights_rounded),
            onPressed: _showForecaster,
            tooltip: 'What If Forecaster',
          ),
        IconButton(
          icon: const Icon(Icons.admin_panel_settings_rounded),
          onPressed: _showProgramManager,
          tooltip: 'Program Manager',
        ),
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: _resetSchedule,
          tooltip: 'Reset Schedule',
        ),
        IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: _showSettingsDialog,
          tooltip: 'Settings',
        ),
        IconButton(
          icon: const Icon(Icons.add_rounded),
          onPressed: _showAddCourseDialog,
          tooltip: 'Add Course',
        ),
        IconButton(
          icon: const Icon(Icons.download_rounded),
          onPressed: _exportSchedule,
          tooltip: 'Export Schedule',
        ),
      ],
    );
  }

  // 🔮 FORECASTER FUNCTIONALITY
  void _showForecaster() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildForecasterSheet(),
    );
  }

  Widget _buildForecasterSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.infoBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.insights_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What If Forecaster',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Text(
                        'Simulate completing semesters with grades',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.background,
                  ),
                ),
              ],
            ),
          ),
          
          // Semester Timeline
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildSemesterTimeline(),
          ),
          
          const SizedBox(height: 20),
          
          // Content based on forecast mode
          Expanded(
            child: _forecastToSemester == null 
              ? _buildForecastInstructions()
              : _buildForecastContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterTimeline() {
    final semesters = semesterCourses.keys.toList();
    final currentIndex = semesters.indexOf('Summer 2025'); // Completed semester
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Forecast to which semester?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: semesters.length,
            itemBuilder: (context, index) {
              final semester = semesters[index];
              final isCompleted = index <= currentIndex;
              final isSelected = _forecastToSemester == semester;
              final isSelectable = index > currentIndex; // Can only forecast future semesters
              
              return GestureDetector(
                onTap: isSelectable ? () {
                  setState(() {
                    _forecastToSemester = semester;
                  });
                } : null,
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? AppColors.infoBlue
                      : isCompleted 
                        ? AppColors.completed.withOpacity(0.1)
                        : isSelectable
                          ? AppColors.surface
                          : AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                        ? AppColors.infoBlue
                        : isCompleted
                          ? AppColors.completed
                          : isSelectable
                            ? AppColors.divider
                            : AppColors.textLight,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isCompleted 
                          ? Icons.check_circle_rounded
                          : isSelected
                            ? Icons.insights_rounded
                            : Icons.schedule_rounded,
                        color: isSelected
                          ? Colors.white
                          : isCompleted
                            ? AppColors.completed
                            : isSelectable
                              ? AppColors.textSecondary
                              : AppColors.textLight,
                        size: 20,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        semester.split(' ')[0], // "Fall", "Spring", etc.
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                            ? Colors.white
                            : isCompleted
                              ? AppColors.completed
                              : isSelectable
                                ? AppColors.textPrimary
                                : AppColors.textLight,
                        ),
                      ),
                      Text(
                        semester.split(' ')[1], // "2025", "2026", etc.
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected
                            ? Colors.white70
                            : isCompleted
                              ? AppColors.completed
                              : isSelectable
                                ? AppColors.textSecondary
                                : AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForecastInstructions() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.touch_app_rounded,
            size: 64,
            color: AppColors.textLight,
          ),
          const SizedBox(height: 16),
          const Text(
            'Select a Semester Above',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose which semester to forecast to and see your graduation progress.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.infoBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.infoBlue.withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      color: AppColors.infoBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'How it works',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.infoBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '• Input expected grades for each course\n• See your forecasted GPA and progress\n• Check graduation requirements status\n• Plan your academic path with confidence',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastContent() {
    final semesters = semesterCourses.keys.toList();
    final forecastIndex = semesters.indexOf(_forecastToSemester!);
    final semestersToForecast = semesters.take(forecastIndex + 1).where((s) => s != 'Summer 2025').toList();
    
    return Column(
      children: [
        // Progress Dashboard
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildForecastProgress(),
        ),
        
        const SizedBox(height: 20),
        
        // Grade Input Section
        Expanded(
          child: DefaultTabController(
            length: semestersToForecast.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  labelColor: AppColors.infoBlue,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.infoBlue,
                  tabs: semestersToForecast.map((semester) => Tab(
                    text: semester.split(' ')[0], // "Fall", "Spring", etc.
                  )).toList(),
                ),
                
                Expanded(
                  child: TabBarView(
                    children: semestersToForecast.map((semester) => 
                      _buildGradeInputList(semester)
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Action Buttons
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _forecastToSemester = null;
                      _forecastedGrades.clear();
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.divider),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Clear'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _startForecastMode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.infoBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Start Forecast'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildForecastProgress() {
    final forecastedData = _calculateForecastedProgress();
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Forecasted Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildProgressMetric(
                'Cumulative GPA', 
                forecastedData['gpa'].toStringAsFixed(2),
                AppColors.getGpaColor(forecastedData['gpa']),
              ),
              _buildProgressMetric(
                'Credits Completed', 
                '${forecastedData['credits']}/120',
                AppColors.infoBlue,
              ),
              _buildProgressMetric(
                'Upper Level', 
                '${forecastedData['upperLevel']}/42',
                AppColors.minorPrimary,
              ),
              _buildProgressMetric(
                'Graduation', 
                forecastedData['graduationStatus'],
                forecastedData['graduationColor'],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressMetric(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGradeInputList(String semester) {
    final courses = semesterCourses[semester]!;
    
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return _buildGradeInputCard(course, semester);
      },
    );
  }

  Widget _buildGradeInputCard(PlannedCourse course, String semester) {
    final currentGrade = _forecastedGrades[course.id] ?? 'A';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.getCourseColor(
                      course.requirements.isNotEmpty ? course.requirements.first : ''
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getCourseIcon(course),
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.code} - ${course.title}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '${course.credits} credits • ${course.requirements.join(', ')}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                const Text(
                  'Expected Grade:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: ['A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C'].map((grade) {
                      final isSelected = currentGrade == grade;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _forecastedGrades[course.id] = grade;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.infoBlue : AppColors.background,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: isSelected ? AppColors.infoBlue : AppColors.divider,
                              ),
                            ),
                            child: Text(
                              grade,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 📊 FORECAST CALCULATIONS
  Map<String, dynamic> _calculateForecastedProgress() {
    if (_forecastToSemester == null) {
      return {
        'gpa': 0.0,
        'credits': 0,
        'upperLevel': 0,
        'graduationStatus': 'Not Started',
        'graduationColor': AppColors.textLight,
      };
    }
    
    final semesters = semesterCourses.keys.toList();
    final forecastIndex = semesters.indexOf(_forecastToSemester!);
    final completedSemesters = semesters.take(forecastIndex + 1);
    
    double totalGradePoints = 0;
    int totalCredits = 0;
    int upperLevelCredits = 0;
    
    // Include actual completed courses (Summer 2025)
    for (var course in semesterCourses['Summer 2025']!) {
      if (course.isCompleted && course.grade != null) {
        final gpa = _gradeToGPA(course.grade!);
        totalGradePoints += gpa * course.credits;
        totalCredits += course.credits;
        upperLevelCredits += course.credits; // All Summer 2025 are upper level
      }
    }
    
    // Include forecasted courses
    for (var semester in completedSemesters) {
      if (semester == 'Summer 2025') continue; // Already counted
      
      for (var course in semesterCourses[semester]!) {
        final grade = _forecastedGrades[course.id] ?? 'A';
        final gpa = _gradeToGPA(grade);
        totalGradePoints += gpa * course.credits;
        totalCredits += course.credits;
        
        // Count upper level credits (courses 3000+)
        if (course.code.isNotEmpty && course.code.length >= 4) {
          final courseNumber = int.tryParse(course.code.substring(4, 5)) ?? 0;
          if (courseNumber >= 3) {
            upperLevelCredits += course.credits;
          }
        }
      }
    }
    
    final cumulativeGPA = totalCredits > 0 ? totalGradePoints / totalCredits : 0.0;
    
    // Determine graduation status
    String graduationStatus;
    Color graduationColor;
    
    if (totalCredits >= 120 && upperLevelCredits >= 42 && cumulativeGPA >= 2.0) {
      graduationStatus = 'Ready!';
      graduationColor = AppColors.successGreen;
    } else if (totalCredits >= 90) {
      graduationStatus = 'On Track';
      graduationColor = AppColors.infoBlue;
    } else if (totalCredits >= 60) {
      graduationStatus = 'Progressing';
      graduationColor = AppColors.warningAmber;
    } else {
      graduationStatus = 'Early';
      graduationColor = AppColors.textSecondary;
    }
    
    return {
      'gpa': cumulativeGPA,
      'credits': totalCredits,
      'upperLevel': upperLevelCredits,
      'graduationStatus': graduationStatus,
      'graduationColor': graduationColor,
    };
  }

  double _gradeToGPA(String grade) {
    switch (grade) {
      case 'A+':
      case 'A':
        return 4.0;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'C-':
        return 1.7;
      case 'D+':
        return 1.3;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 4.0; // Default to A
    }
  }

  void _startForecastMode() {
    setState(() {
      _isForecasting = true;
    });
    Navigator.pop(context); // Close forecaster modal
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🔮 Forecasting to $_forecastToSemester - Tap courses to see forecasted grades'),
        backgroundColor: AppColors.infoBlue,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'EXIT',
          textColor: Colors.white,
          onPressed: _exitForecastMode,
        ),
      ),
    );
  }

  void _exitForecastMode() {
    setState(() {
      _isForecasting = false;
      _forecastToSemester = null;
      _forecastedGrades.clear();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Exited forecast mode'),
        backgroundColor: AppColors.successGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }

  // 🎓 PROGRAM MANAGER FUNCTIONALITY
  void _showProgramManager() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildProgramManagerSheet(),
    );
  }

  Widget _buildProgramManagerSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: AppColors.honorsGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.admin_panel_settings_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Program Manager',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Text(
                        'Enable/disable academic programs',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.background,
                  ),
                ),
              ],
            ),
          ),
          
          // Program List
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProgramCard(
                    title: 'Political Science B.A.',
                    subtitle: 'Major - Required for graduation',
                    icon: Icons.account_balance_rounded,
                    color: AppColors.majorPrimary,
                    isEnabled: true,
                    isRequired: true,
                    courses: _getPoliticalScienceCourses(),
                    onToggle: null, // Can't disable required major
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildProgramCard(
                    title: 'Technology & Law Certificate',
                    subtitle: '15 credits - Law-Centered Track',
                    icon: Icons.gavel_rounded,
                    color: AppColors.certPrimary,
                    isEnabled: _isCertificateEnabled(),
                    isRequired: false,
                    courses: _getCertificateCourses(),
                    onToggle: (enabled) => _toggleCertificate(enabled),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildProgramCard(
                    title: 'CODE Minor',
                    subtitle: '18 credits - AI/ML Track',
                    icon: Icons.code_rounded,
                    color: AppColors.minorPrimary,
                    isEnabled: _isMinorEnabled(),
                    isRequired: false,
                    courses: _getMinorCourses(),
                    onToggle: (enabled) => _toggleMinor(enabled),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildProgramCard(
                    title: 'Honors Program',
                    subtitle: '9 credits - 3 honors courses',
                    icon: Icons.auto_awesome_rounded,
                    color: AppColors.honorsGold,
                    isEnabled: _isHonorsEnabled(),
                    isRequired: true,
                    courses: _getHonorsCourses(),
                    onToggle: (enabled) => _toggleHonors(enabled),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Info box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.infoBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.infoBlue.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: AppColors.infoBlue,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'How it works',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.infoBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '• Disabling a program removes its required courses\n• Courses are replaced with "Free Elective" placeholders\n• Overlap courses (like PLA 4410) are preserved if needed\n• You can re-enable programs anytime',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 100), // Bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required bool isEnabled,
    required bool isRequired,
    required List<String> courses,
    required void Function(bool)? onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEnabled ? color.withOpacity(0.3) : AppColors.divider,
          width: isEnabled ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isEnabled ? color : AppColors.textLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isEnabled ? AppColors.textPrimary : AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: isEnabled ? AppColors.textSecondary : AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isRequired)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.majorPrimary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.majorPrimary.withOpacity(0.3),
                      ),
                    ),
                    child: const Text(
                      'REQUIRED',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.majorPrimary,
                      ),
                    ),
                  )
                else
                  Switch(
                    value: isEnabled,
                    onChanged: onToggle,
                    activeColor: color,
                  ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Course count and preview
            Row(
              children: [
                Icon(
                  Icons.school_rounded,
                  size: 16,
                  color: isEnabled ? AppColors.textSecondary : AppColors.textLight,
                ),
                const SizedBox(width: 4),
                Text(
                  '${courses.length} courses',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isEnabled ? AppColors.textSecondary : AppColors.textLight,
                  ),
                ),
                const Spacer(),
                if (!isEnabled && !isRequired)
                  const Text(
                    'DISABLED',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
              ],
            ),
            
            if (courses.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: courses.take(6).map((courseCode) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isEnabled ? color.withOpacity(0.1) : AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isEnabled ? color.withOpacity(0.3) : AppColors.divider,
                    ),
                  ),
                  child: Text(
                    courseCode,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isEnabled ? color : AppColors.textLight,
                    ),
                  ),
                )).toList(),
              ),
              if (courses.length > 6)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '+${courses.length - 6} more...',
                    style: TextStyle(
                      fontSize: 10,
                      color: isEnabled ? AppColors.textSecondary : AppColors.textLight,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  // 🔍 PROGRAM DETECTION METHODS
  
  List<String> _getPoliticalScienceCourses() {
    final courses = <String>[];
    for (var semesterCourses in semesterCourses.values) {
      for (var course in semesterCourses) {
        if (course.requirements.any((req) => req.contains('Major'))) {
          courses.add(course.code);
        }
      }
    }
    return courses.toSet().toList(); // Remove duplicates
  }

  List<String> _getCertificateCourses() {
    final courses = <String>[];
    for (var semesterCourses in semesterCourses.values) {
      for (var course in semesterCourses) {
        if (course.requirements.any((req) => req.contains('Certificate'))) {
          courses.add(course.code);
        }
      }
    }
    return courses.toSet().toList();
  }

  List<String> _getMinorCourses() {
    final courses = <String>[];
    for (var semesterCourses in semesterCourses.values) {
      for (var course in semesterCourses) {
        if (course.requirements.any((req) => req.contains('CODE Minor'))) {
          courses.add(course.code);
        }
      }
    }
    return courses.toSet().toList();
  }

  List<String> _getHonorsCourses() {
    final courses = <String>[];
    for (var semesterCourses in semesterCourses.values) {
      for (var course in semesterCourses) {
        if (course.requirements.any((req) => req.contains('Honors'))) {
          courses.add(course.code);
        }
      }
    }
    return courses.toSet().toList();
  }

  bool _isCertificateEnabled() {
    return _getCertificateCourses().isNotEmpty;
  }

  bool _isMinorEnabled() {
    return _getMinorCourses().isNotEmpty;
  }

  bool _isHonorsEnabled() {
    return _getHonorsCourses().isNotEmpty;
  }

  // 🔄 PROGRAM TOGGLE METHODS
  
  void _toggleCertificate(bool enabled) {
    if (enabled) {
      _enableCertificate();
    } else {
      _disableCertificate();
    }
  }

  void _toggleMinor(bool enabled) {
    if (enabled) {
      _enableMinor();
    } else {
      _disableMinor();
    }
  }

  void _toggleHonors(bool enabled) {
    if (enabled) {
      _enableHonors();
    } else {
      _disableHonors();
    }
  }

  void _disableCertificate() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_rounded, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Disable Certificate Program'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This will remove all Tech & Law Certificate courses from your schedule:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ..._getCertificateCourses().map((courseCode) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, color: AppColors.errorRed, size: 16),
                  const SizedBox(width: 8),
                  Text(courseCode, style: const TextStyle(fontFamily: 'monospace')),
                ],
              ),
            )),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.infoBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.infoBlue.withOpacity(0.3)),
              ),
              child: const Text(
                'These will be replaced with "Free Elective" placeholders. Overlap courses (like PLA 4410) will be preserved if they satisfy other requirements.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Close program manager
              _performDisableCertificate();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: Colors.white,
            ),
            child: const Text('Disable Certificate'),
          ),
        ],
      ),
    );
  }

  void _disableMinor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_rounded, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Disable Minor Program'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This will remove all CODE Minor courses from your schedule:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ..._getMinorCourses().map((courseCode) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, color: AppColors.errorRed, size: 16),
                  const SizedBox(width: 8),
                  Text(courseCode, style: const TextStyle(fontFamily: 'monospace')),
                ],
              ),
            )),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warningAmber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.warningAmber.withOpacity(0.3)),
              ),
              child: const Text(
                'Note: This will free up 18 credits (6 courses) in your schedule.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Close program manager
              _performDisableMinor();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: Colors.white,
            ),
            child: const Text('Disable Minor'),
          ),
        ],
      ),
    );
  }

  void _disableHonors() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_rounded, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Disable Honors Program'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This will remove all Honors courses from your schedule:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ..._getHonorsCourses().map((courseCode) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, color: AppColors.errorRed, size: 16),
                  const SizedBox(width: 8),
                  Text(courseCode, style: const TextStyle(fontFamily: 'monospace')),
                ],
              ),
            )),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.infoBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.infoBlue.withOpacity(0.3)),
              ),
              child: const Text(
                'This will free up 9 credits (3 courses) for additional electives.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Close program manager
              _performDisableHonors();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: Colors.white,
            ),
            child: const Text('Disable Honors'),
          ),
        ],
      ),
    );
  }

  // 🗑️ PROGRAM REMOVAL LOGIC
  
  void _performDisableCertificate() {
    setState(() {
      final removedCourses = <String>[];
      
      // Remove certificate-only courses
      for (var semester in semesterCourses.keys) {
        final coursesToRemove = <PlannedCourse>[];
        
        for (var course in semesterCourses[semester]!) {
          // Only remove if it ONLY satisfies certificate (not overlap courses)
          if (course.requirements.length == 1 && 
              course.requirements.first.contains('Certificate')) {
            coursesToRemove.add(course);
            removedCourses.add(course.code);
          }
          // For overlap courses, just remove the certificate requirement
          else if (course.requirements.any((req) => req.contains('Certificate'))) {
            course.requirements.removeWhere((req) => req.contains('Certificate'));
          }
        }
        
        // Remove courses and replace with free electives
        for (var courseToRemove in coursesToRemove) {
          semesterCourses[semester]!.remove(courseToRemove);
          
          // Add free elective placeholder
          semesterCourses[semester]!.add(PlannedCourse(
            id: 'FREE_ELEC_${DateTime.now().millisecondsSinceEpoch}',
            code: 'FREE ELEC',
            title: 'Free Elective',
            credits: courseToRemove.credits,
            requirements: ['Free Elective'],
            isNewlyAdded: true,
          ));
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Tech & Law Certificate disabled - freed up space for electives'),
        backgroundColor: AppColors.successGreen,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: _enableCertificate,
        ),
      ),
    );
  }

  void _performDisableMinor() {
    setState(() {
      // Remove all CODE Minor courses
      for (var semester in semesterCourses.keys) {
        final coursesToRemove = <PlannedCourse>[];
        
        for (var course in semesterCourses[semester]!) {
          if (course.requirements.any((req) => req.contains('CODE Minor'))) {
            coursesToRemove.add(course);
          }
        }
        
        // Remove courses and replace with free electives
        for (var courseToRemove in coursesToRemove) {
          semesterCourses[semester]!.remove(courseToRemove);
          
          // Add free elective placeholder
          semesterCourses[semester]!.add(PlannedCourse(
            id: 'FREE_ELEC_${DateTime.now().millisecondsSinceEpoch}',
            code: 'FREE ELEC',
            title: 'Free Elective',
            credits: courseToRemove.credits,
            requirements: ['Free Elective'],
            isNewlyAdded: true,
          ));
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ CODE Minor disabled - freed up 18 credits'),
        backgroundColor: AppColors.successGreen,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: _enableMinor,
        ),
      ),
    );
  }

  void _performDisableHonors() {
    setState(() {
      // Remove all Honors courses
      for (var semester in semesterCourses.keys) {
        final coursesToRemove = <PlannedCourse>[];
        
        for (var course in semesterCourses[semester]!) {
          if (course.requirements.any((req) => req.contains('Honors'))) {
            coursesToRemove.add(course);
          }
        }
        
        // Remove courses and replace with free electives
        for (var courseToRemove in coursesToRemove) {
          semesterCourses[semester]!.remove(courseToRemove);
          
          // Add free elective placeholder
          semesterCourses[semester]!.add(PlannedCourse(
            id: 'FREE_ELEC_${DateTime.now().millisecondsSinceEpoch}',
            code: 'FREE ELEC',
            title: 'Free Elective',
            credits: courseToRemove.credits,
            requirements: ['Free Elective'],
            isNewlyAdded: true,
          ));
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Honors Program disabled - freed up 9 credits'),
        backgroundColor: AppColors.successGreen,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: _enableHonors,
        ),
      ),
    );
  }

  // 🔄 PROGRAM RE-ENABLING (Placeholder - you can implement these later)
  void _enableCertificate() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-enabling programs coming soon! Use Reset Schedule for now.'),
        backgroundColor: AppColors.infoBlue,
      ),
    );
  }

  void _enableMinor() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-enabling programs coming soon! Use Reset Schedule for now.'),
        backgroundColor: AppColors.infoBlue,
      ),
    );
  }

  void _enableHonors() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-enabling programs coming soon! Use Reset Schedule for now.'),
        backgroundColor: AppColors.infoBlue,
      ),
    );
  }

  Widget _buildSummaryHeader() {
    int totalCredits = 0;
    int completedCredits = 0;
    
    for (var courses in semesterCourses.values) {
      for (var course in courses) {
        totalCredits += course.credits;
        if (course.isCompleted) completedCredits += course.credits;
      }
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildSummaryTile('Total Credits', '$totalCredits/120'),
          _buildSummaryTile('Completed', '$completedCredits'),
          _buildSummaryTile('Remaining', '${120 - totalCredits}'),
          _buildSummaryTile('Status', 'On Track'),
        ],
      ),
    );
  }

  Widget _buildSummaryTile(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.majorPrimary,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterGrid() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(), // Better scroll behavior
      itemCount: semesterCourses.length,
      itemBuilder: (context, index) {
        String semester = semesterCourses.keys.elementAt(index);
        List<PlannedCourse> courses = semesterCourses[semester]!;
        
        return _buildSemesterCard(semester, courses);
      },
    );
  }

  Widget _buildSemesterCard(String semester, List<PlannedCourse> courses) {
    int totalCredits = courses.fold(0, (sum, course) => sum + course.credits);
    int totalClasses = courses.length;
    bool isCompleted = semester == 'Summer 2025';
    bool isOverCreditLimit = _enforceMaxCredits && totalCredits > _maxCreditsPerSemester;
    bool isOverClassLimit = _enforceMaxClasses && totalClasses > _maxClassesPerSemester;
    bool hasLimitsIssue = isOverCreditLimit || isOverClassLimit;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasLimitsIssue 
            ? AppColors.errorRed 
            : isCompleted 
              ? AppColors.completed 
              : AppColors.divider,
          width: hasLimitsIssue || isCompleted ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semester Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hasLimitsIssue 
                ? AppColors.errorRed
                : isCompleted 
                  ? AppColors.completed 
                  : AppColors.majorPrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    if (isCompleted)
                      const Icon(Icons.check_circle, color: Colors.white, size: 20),
                    if (hasLimitsIssue)
                      const Icon(Icons.warning, color: Colors.white, size: 20),
                    if (isCompleted || hasLimitsIssue) const SizedBox(width: 8),
                    Text(
                      semester,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$totalCredits credits • $totalClasses classes',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                // Limit warnings
                if (hasLimitsIssue) ...[
                  const SizedBox(height: 8),
                  if (isOverCreditLimit)
                    Text(
                      '⚠️ Exceeds ${_maxCreditsPerSemester} credit limit',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (isOverClassLimit)
                    Text(
                      '⚠️ Exceeds ${_maxClassesPerSemester} class limit',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ],
            ),
          ),
          
          // Course List - Drag & Drop Target
          DragTarget<PlannedCourse>(
            onWillAcceptWithDetails: (details) => _canAcceptCourse(details.data, semester),
            onAcceptWithDetails: (details) => _moveCourse(details.data, semester),
            builder: (context, candidateData, rejectedData) {
              bool wouldExceedLimits = candidateData.isNotEmpty && 
                  candidateData.first != null &&
                  !_canAcceptCourse(candidateData.first!, semester);
              
              return Container(
                constraints: const BoxConstraints(minHeight: 100),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: wouldExceedLimits
                    ? AppColors.errorRed.withOpacity(0.1)
                    : candidateData.isNotEmpty 
                      ? AppColors.majorPrimary.withOpacity(0.1) 
                      : Colors.transparent,
                  border: wouldExceedLimits
                    ? Border.all(color: AppColors.errorRed, width: 2)
                    : null,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: courses.isEmpty 
                  ? _buildEmptyDropZone(wouldExceedLimits)
                  : Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: courses.map((course) => _buildCourseCard(course, semester)).toList(),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyDropZone([bool wouldExceedLimits = false]) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: wouldExceedLimits ? AppColors.errorRed : AppColors.divider,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (wouldExceedLimits) ...[
              const Icon(
                Icons.block,
                color: AppColors.errorRed,
                size: 24,
              ),
              const SizedBox(height: 4),
              const Text(
                'Cannot drop here - limits exceeded',
                style: TextStyle(
                  color: AppColors.errorRed,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ] else ...[
              const Text(
                'Drop courses here',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Hold course cards for 200ms to drag',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 10,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(PlannedCourse course, String semester) {
    Color cardColor = AppColors.getCourseColor(course.requirements.isNotEmpty ? course.requirements.first : '');
    
    return LongPressDraggable<PlannedCourse>(
      data: course,
      delay: const Duration(milliseconds: 200), // Reduced from 300ms for better UX
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                course.code,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Dragging...',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildCourseCardContent(course, cardColor),
      ),
      child: _buildCourseCardContent(course, cardColor),
    );
  }

  Widget _buildCourseCardContent(PlannedCourse course, Color cardColor) {
    return GestureDetector(
      onTap: () => _showCourseDetails(course),
      child: Container(
        constraints: const BoxConstraints(minWidth: 160),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: cardColor.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  course.code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                if (course.isCompleted)
                  const Icon(Icons.check_circle, color: Colors.white, size: 16)
                else
                  const Icon(Icons.drag_indicator, color: Colors.white70, size: 16), // Drag indicator
                if (course.isNewlyAdded)
                  const Icon(Icons.new_releases, color: Colors.amber, size: 16),
                if (course.isCapstone)
                  const Icon(Icons.school, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              course.title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${course.credits} cr',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                if (course.requirements.isNotEmpty)
                  Flexible(
                    child: Text(
                      course.requirements.first,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
            if (course.grade != null) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Grade: ${course.grade}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            if (!course.isCompleted) ...[
              const SizedBox(height: 4),
              const Text(
                'Hold 200ms to drag',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 9,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  bool _canAcceptCourse(PlannedCourse course, String targetSemester) {
    // Don't allow moving completed courses
    if (course.isCompleted) {
      return false;
    }

    // Calculate what the limits would be after adding this course
    List<PlannedCourse> targetCourses = semesterCourses[targetSemester]!;
    int targetCredits = targetCourses.fold(0, (sum, c) => sum + c.credits) + course.credits;
    int targetClasses = targetCourses.length + 1;

    // Check credit limit
    if (_enforceMaxCredits && targetCredits > _maxCreditsPerSemester) {
      return false;
    }

    // Check class limit
    if (_enforceMaxClasses && targetClasses > _maxClassesPerSemester) {
      return false;
    }

    // Allow the move if limits are okay
    return true;
  }

  void _resetSchedule() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.refresh_rounded, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Reset Schedule'),
          ],
        ),
        content: const Text(
          'This will reset your course schedule to the original corrected plan. Any changes you made will be lost.\n\nAre you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _resetToOriginalSchedule();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Schedule reset to original plan'),
                  backgroundColor: AppColors.successGreen,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.warningAmber,
              foregroundColor: Colors.white,
            ),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _resetToOriginalSchedule() {
    semesterCourses = {
      'Summer 2025': [
        // ✅ COMPLETED COURSES
        PlannedCourse(
          id: 'CPO3034',
          code: 'CPO 3034',
          title: 'Politics of Developing Areas',
          credits: 3,
          requirements: ['Major (Area B)'],
          isCompleted: true,
          grade: 'A',
        ),
        PlannedCourse(
          id: 'GEO3471',
          code: 'GEO 3471',
          title: 'World Political Geography',
          credits: 3,
          requirements: ['Major (Area C)'],
          isCompleted: true,
          grade: 'A-',
        ),
        PlannedCourse(
          id: 'PLA4410',
          code: 'PLA 4410',
          title: 'Intellectual Property Law',
          credits: 3,
          requirements: ['Major (Core)', 'Certificate'],
          isCompleted: true,
          grade: 'A',
        ),
        PlannedCourse(
          id: 'POS3424',
          code: 'POS 3424',
          title: 'Congress & Legislative Process',
          credits: 3,
          requirements: ['Major (Core)'],
          isCompleted: true,
          grade: 'A+',
        ),
      ],
      'Fall 2025': [
        PlannedCourse(
          id: 'CPO3103',
          code: 'CPO 3103',
          title: 'Comparative Politics',
          credits: 3,
          requirements: ['Major (Area A)'],
        ),
        PlannedCourse(
          id: 'PLA3108',
          code: 'PLA 3108',
          title: 'Legal Research',
          credits: 3,
          requirements: ['Major (Core)'],
        ),
        PlannedCourse(
          id: 'POS3413',
          code: 'POS 3413',
          title: 'The American Presidency',
          credits: 3,
          requirements: ['Major (Core)'],
        ),
        PlannedCourse(
          id: 'POS4284',
          code: 'POS 4284',
          title: 'Judicial Process & Politics',
          credits: 3,
          requirements: ['Major (Area A)'],
        ),
        PlannedCourse(
          id: 'PUP3204',
          code: 'PUP 3204',
          title: 'Sustainability',
          credits: 3,
          requirements: ['Major (Elective)'],
        ),
      ],
      'Spring 2026': [
        PlannedCourse(
          id: 'INR4074',
          code: 'INR 4074',
          title: 'Immigration Policy',
          credits: 3,
          requirements: ['Major (Elective)'],
        ),
        PlannedCourse(
          id: 'POS4941',
          code: 'POS 4941',
          title: 'Political Science Internship',
          credits: 3,
          requirements: ['Major (Elective)'],
        ),
        PlannedCourse(
          id: 'PLA4585',
          code: 'PLA 4585',
          title: 'Cybersecurity and the Law',
          credits: 3,
          requirements: ['Certificate'],
          isNewlyAdded: true,
        ),
        PlannedCourse(
          id: 'AMH3421',
          code: 'AMH 3421',
          title: 'American Legal History',
          credits: 3,
          requirements: ['Major (Elective)'],
        ),
        PlannedCourse(
          id: 'HONR1',
          code: 'HONR',
          title: 'Honors Requirement #1',
          credits: 3,
          requirements: ['Honors'],
        ),
      ],
      'Summer 2026': [
        PlannedCourse(
          id: 'POS3703',
          code: 'POS 3703',
          title: 'Scope and Methods of Pol Sci',
          credits: 3,
          requirements: ['Major (Core)'],
        ),
        PlannedCourse(
          id: 'COP2500C',
          code: 'COP 2500C',
          title: 'Concepts in Comp Sci',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
        PlannedCourse(
          id: 'COP3223C',
          code: 'COP 3223C',
          title: 'Intro to Programming in C',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
        PlannedCourse(
          id: 'POT4003',
          code: 'POT 4003',
          title: 'Political Theory',
          credits: 3,
          requirements: ['Major (Area C)'],
          isNewlyAdded: true,
        ),
        PlannedCourse(
          id: 'HONR2',
          code: 'HONR',
          title: 'Honors Requirement #2',
          credits: 3,
          requirements: ['Honors'],
        ),
        PlannedCourse(
          id: 'HONR2',
          code: 'HONR',
          title: 'Honors Requirement #2',
          credits: 3,
          requirements: ['Honors'],
        ),
      ],
      'Fall 2026': [
        PlannedCourse(
          id: 'POS4603',
          code: 'POS 4603',
          title: 'American Constitutional Law I',
          credits: 3,
          requirements: ['Major (Law Requirement)'],
          isNewlyAdded: true,
        ),
        PlannedCourse(
          id: 'COP3330',
          code: 'COP 3330',
          title: 'Object-Oriented Programming',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
        PlannedCourse(
          id: 'STA4241',
          code: 'STA 4241',
          title: 'Statistical Learning',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
        PlannedCourse(
          id: 'STA4364',
          code: 'STA 4364',
          title: 'Stat Foundations of Data Sci',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
        PlannedCourse(
          id: 'HONR3',
          code: 'HONR',
          title: 'Honors Requirement #3',
          credits: 3,
          requirements: ['Honors'],
        ),
      ],
      'Spring 2027': [
        PlannedCourse(
          id: 'POS4961',
          code: 'POS 4961',
          title: 'Exit Course (Capstone)',
          credits: 3,
          requirements: ['Major (Capstone)'],
          isCapstone: true,
        ),
        PlannedCourse(
          id: 'PLA3871',
          code: 'PLA 3871',
          title: 'Law and Technology',
          credits: 3,
          requirements: ['Certificate'],
        ),
        PlannedCourse(
          id: 'HIS3462',
          code: 'HIS 3462',
          title: 'History of Science',
          credits: 3,
          requirements: ['Certificate'],
        ),
        PlannedCourse(
          id: 'PHI3626',
          code: 'PHI 3626',
          title: 'Ethics in Science/Tech',
          credits: 3,
          requirements: ['Certificate'],
          isNewlyAdded: true,
        ),
        PlannedCourse(
          id: 'MAP4112',
          code: 'MAP 4112',
          title: 'ML & AI Foundations',
          credits: 3,
          requirements: ['CODE Minor'],
        ),
      ],
    };
  }

  void _moveCourse(PlannedCourse course, String targetSemester) {
    setState(() {
      // Remove from current semester
      for (var semester in semesterCourses.keys) {
        semesterCourses[semester]!.removeWhere((c) => c.id == course.id);
      }
      
      // Add to target semester
      semesterCourses[targetSemester]!.add(course);
    });

    // Show validation warning if needed
    _validateCourseMove(course, targetSemester);
  }

  void _validateCourseMove(PlannedCourse course, String targetSemester) {
    List<String> warnings = [];

    // Check semester limits
    List<PlannedCourse> targetCourses = semesterCourses[targetSemester]!;
    int targetCredits = targetCourses.fold(0, (sum, c) => sum + c.credits);
    int targetClasses = targetCourses.length;

    if (_enforceMaxCredits && targetCredits > _maxCreditsPerSemester) {
      warnings.add('This semester exceeds the ${_maxCreditsPerSemester} credit limit ($targetCredits credits)');
    }

    if (_enforceMaxClasses && targetClasses > _maxClassesPerSemester) {
      warnings.add('This semester exceeds the ${_maxClassesPerSemester} class limit ($targetClasses classes)');
    }

    // Check if capstone is in final semester
    if (course.isCapstone && targetSemester != 'Spring 2027') {
      warnings.add('Capstone course should be in final semester (Spring 2027)');
    }

    // Check if it's a completed course being moved
    if (course.isCompleted) {
      warnings.add('This course is already completed and cannot be moved');
    }

    // Check prerequisites (simplified)
    if (course.code == 'COP 3330' && !_hasPrerequisite('COP 3223C', targetSemester)) {
      warnings.add('COP 3330 requires COP 3223C as prerequisite');
    }

    if (warnings.isNotEmpty) {
      _showValidationDialog(warnings);
    } else {
      // Show success message for valid moves
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ${course.code} moved to $targetSemester'),
          backgroundColor: AppColors.successGreen,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  bool _hasPrerequisite(String prereqCode, String beforeSemester) {
    List<String> semesterOrder = ['Summer 2025', 'Fall 2025', 'Spring 2026', 'Summer 2026', 'Fall 2026', 'Spring 2027'];
    int targetIndex = semesterOrder.indexOf(beforeSemester);
    
    for (int i = 0; i < targetIndex; i++) {
      String semester = semesterOrder[i];
      if (semesterCourses[semester]?.any((course) => course.code == prereqCode) == true) {
        return true;
      }
    }
    return false;
  }

  void _showValidationDialog(List<String> warnings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Validation Warning'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: warnings.map((warning) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('• $warning'),
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.settings_rounded, color: AppColors.majorPrimary),
              SizedBox(width: 8),
              Text('Schedule Settings'),
            ],
          ),
          content: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Semester Limits',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Credit Limit Setting
                Row(
                  children: [
                    Checkbox(
                      value: _enforceMaxCredits,
                      onChanged: (value) {
                        setDialogState(() {
                          _enforceMaxCredits = value ?? true;
                        });
                      },
                      activeColor: AppColors.majorPrimary,
                    ),
                    const Expanded(
                      child: Text('Enforce credit limit'),
                    ),
                  ],
                ),
                if (_enforceMaxCredits) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        const Text('Max credits: '),
                        const SizedBox(width: 8),
                        DropdownButton<int>(
                          value: _maxCreditsPerSemester,
                          items: [12, 15, 18, 21].map((credits) {
                            return DropdownMenuItem(
                              value: credits,
                              child: Text('$credits'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setDialogState(() {
                              _maxCreditsPerSemester = value ?? 15;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                
                // Class Limit Setting
                Row(
                  children: [
                    Checkbox(
                      value: _enforceMaxClasses,
                      onChanged: (value) {
                        setDialogState(() {
                          _enforceMaxClasses = value ?? true;
                        });
                      },
                      activeColor: AppColors.majorPrimary,
                    ),
                    const Expanded(
                      child: Text('Enforce class limit'),
                    ),
                  ],
                ),
                if (_enforceMaxClasses) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        const Text('Max classes: '),
                        const SizedBox(width: 8),
                        DropdownButton<int>(
                          value: _maxClassesPerSemester,
                          items: [4, 5, 6, 7].map((classes) {
                            return DropdownMenuItem(
                              value: classes,
                              child: Text('$classes'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setDialogState(() {
                              _maxClassesPerSemester = value ?? 5;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                
                // Info text
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.infoBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.infoBlue.withOpacity(0.3),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ℹ️ Recommendations:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.infoBlue,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• 15 credits = standard full-time load\n• 5 classes = manageable workload\n• Limits help prevent overloading',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Settings are already updated through setDialogState
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings updated!'),
                    backgroundColor: AppColors.successGreen,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.majorPrimary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCourseDetails(PlannedCourse course) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildCourseDetailsSheet(course),
    );
  }

  // 📱 ENHANCED COURSE DETAILS MODAL WITH SWAP FEATURE
  Widget _buildCourseDetailsSheet(PlannedCourse course) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7, // Made taller for more content
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.getCourseColor(
                            course.requirements.isNotEmpty ? course.requirements.first : ''
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getCourseIcon(course),
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.code,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              course.title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (course.isCompleted)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.completed,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Completed',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Course Details
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow('Credits', '${course.credits}'),
                          _buildDetailRow('Requirements', course.requirements.join(', ')),
                          if (course.grade != null)
                            _buildDetailRow('Grade', course.grade!),
                          if (course.isCompleted)
                            _buildDetailRow('Status', 'Completed'),
                          if (course.isNewlyAdded)
                            _buildDetailRow('Note', 'Recently added to fix requirements'),
                          if (course.isCapstone)
                            _buildDetailRow('Type', 'Capstone Course'),
                          
                          const SizedBox(height: 24),
                          
                          // Course Description (if available)
                          if (course.title.isNotEmpty) ...[
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _getCourseDescription(course),
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ],
                      ),
                    ),
                  ),
                  
                  // Action Buttons
                  if (!course.isCompleted) ...[
                    const Divider(),
                    const SizedBox(height: 16),
                    
                    // Swap from Catalog Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showSwapFromCatalog(course),
                        icon: const Icon(Icons.swap_horizontal_circle_rounded),
                        label: const Text('Swap from Catalog'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.majorPrimary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Secondary Actions Row
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _moveCourseToSemester(course),
                            icon: const Icon(Icons.calendar_month_rounded, size: 18),
                            label: const Text('Move'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.minorPrimary,
                              side: const BorderSide(color: AppColors.minorPrimary),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _removeCourse(course),
                            icon: const Icon(Icons.delete_outline_rounded, size: 18),
                            label: const Text('Remove'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.errorRed,
                              side: const BorderSide(color: AppColors.errorRed),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔄 SWAP FROM CATALOG FUNCTIONALITY
  void _showSwapFromCatalog(PlannedCourse currentCourse) {
    Navigator.pop(context); // Close current modal
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSwapCatalogSheet(currentCourse),
    );
  }

  // 🔄 ENHANCED SWAP FUNCTIONALITY - Replace these methods in your schedule_screen.dart

  Widget _buildSwapCatalogSheet(PlannedCourse currentCourse) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.background,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Swap Course',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              'Replace ${currentCourse.code} with another course',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Current Course Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.getCourseColor(
                              currentCourse.requirements.isNotEmpty ? currentCourse.requirements.first : ''
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _getCourseIcon(currentCourse),
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${currentCourse.code} - ${currentCourse.title}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                '${currentCourse.credits} credits • ${currentCourse.requirements.join(', ')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Tab Bar
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.majorPrimary,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: AppColors.textSecondary,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.library_books_rounded, size: 20),
                          text: 'From Catalog',
                        ),
                        Tab(
                          icon: Icon(Icons.swap_horiz_rounded, size: 20),
                          text: 'From Schedule',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab Views
            Expanded(
              child: TabBarView(
                children: [
                  // From Catalog Tab
                  _buildCatalogCoursesList(currentCourse),
                  // From Schedule Tab
                  _buildScheduleCoursesList(currentCourse),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatalogCoursesList(PlannedCourse currentCourse) {
    // Get compatible courses from catalogs (existing functionality)
    final compatibleCourses = _getCompatibleCourses(currentCourse);
    
    if (compatibleCourses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 64,
              color: AppColors.textLight,
            ),
            const SizedBox(height: 16),
            Text(
              'No compatible courses found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This course has specific requirements that\ncannot be substituted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: compatibleCourses.length,
      itemBuilder: (context, index) {
        final course = compatibleCourses[index];
        return _buildCompatibleCourseCard(course, currentCourse);
      },
    );
  }

  Widget _buildScheduleCoursesList(PlannedCourse currentCourse) {
    final swappableCourses = _getSwappableCoursesFromSchedule(currentCourse);
    
    if (swappableCourses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy_rounded,
              size: 64,
              color: AppColors.textLight,
            ),
            const SizedBox(height: 16),
            Text(
              'No swappable courses found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No courses in your schedule can be\nswapped with this course.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: swappableCourses.length,
      itemBuilder: (context, index) {
        final courseData = swappableCourses[index];
        return _buildScheduleCourseCard(courseData, currentCourse);
      },
    );
  }

  Widget _buildScheduleCourseCard(Map<String, dynamic> courseData, PlannedCourse currentCourse) {
    final course = courseData['course'] as PlannedCourse;
    final semester = courseData['semester'] as String;
    final canSwap = courseData['canSwap'] as bool;
    final reason = courseData['reason'] as String?;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: canSwap ? AppColors.divider : AppColors.errorRed.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.getCourseColor(
              course.requirements.isNotEmpty ? course.requirements.first : ''
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCourseIcon(course),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          '${course.code} - ${course.title}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: canSwap ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.majorPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.majorPrimary.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    semester,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.majorPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${course.credits} credits',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              course.requirements.join(', '),
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textLight,
              ),
            ),
            if (!canSwap && reason != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 14,
                    color: AppColors.warningAmber,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      reason,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.warningAmber,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (course.isCompleted) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 14,
                    color: AppColors.completed,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Completed - Grade: ${course.grade}',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.completed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing: ElevatedButton(
          onPressed: canSwap 
            ? () => _confirmScheduleSwap(currentCourse, course, semester)
            : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: canSwap ? AppColors.minorPrimary : AppColors.textLight,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Swap',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  // 🔍 GET SWAPPABLE COURSES FROM SCHEDULE
  List<Map<String, dynamic>> _getSwappableCoursesFromSchedule(PlannedCourse currentCourse) {
    final swappableCourses = <Map<String, dynamic>>[];
    
    // Get current course's semester
    String? currentSemester;
    for (var entry in semesterCourses.entries) {
      if (entry.value.any((course) => course.id == currentCourse.id)) {
        currentSemester = entry.key;
        break;
      }
    }
    
    // Look through all semesters except the current one
    for (var entry in semesterCourses.entries) {
      final semester = entry.key;
      final courses = entry.value;
      
      // Skip current semester
      if (semester == currentSemester) continue;
      
      for (var course in courses) {
        // Skip if same course somehow
        if (course.id == currentCourse.id) continue;
        
        // Check if swap is possible and get reason if not
        final swapResult = _canSwapWithScheduleCourse(currentCourse, course, semester, currentSemester!);
        
        swappableCourses.add({
          'course': course,
          'semester': semester,
          'canSwap': swapResult['canSwap'],
          'reason': swapResult['reason'],
        });
      }
    }
    
    // Sort: swappable courses first, then by semester order
    final semesterOrder = ['Summer 2025', 'Fall 2025', 'Spring 2026', 'Summer 2026', 'Fall 2026', 'Spring 2027'];
    
    swappableCourses.sort((a, b) {
      // First, sort by whether they can swap
      if ((a['canSwap'] as bool) != (b['canSwap'] as bool)) {
        return (b['canSwap'] as bool) ? 1 : -1; // canSwap courses first
      }
      
      // Then sort by semester order
      final aIndex = semesterOrder.indexOf(a['semester'] as String);
      final bIndex = semesterOrder.indexOf(b['semester'] as String);
      return aIndex.compareTo(bIndex);
    });
    
    return swappableCourses;
  }

  Map<String, dynamic> _canSwapWithScheduleCourse(PlannedCourse currentCourse, PlannedCourse targetCourse, String targetSemester, String currentSemester) {
    // Can't swap completed courses
    if (currentCourse.isCompleted) {
      return {'canSwap': false, 'reason': 'Cannot move completed courses'};
    }
    
    if (targetCourse.isCompleted) {
      return {'canSwap': false, 'reason': 'Cannot move completed courses'};
    }
    
    // Check if capstone course is being moved from final semester
    if (currentCourse.isCapstone && targetSemester != 'Spring 2027') {
      return {'canSwap': false, 'reason': 'Capstone must stay in final semester'};
    }
    
    if (targetCourse.isCapstone && currentSemester != 'Spring 2027') {
      return {'canSwap': false, 'reason': 'Capstone must stay in final semester'};
    }
    
    // Check credit limits for both semesters after swap
    final currentSemesterCourses = semesterCourses[currentSemester]!;
    final targetSemesterCourses = semesterCourses[targetSemester]!;
    
    // Calculate credits after swap
    final currentSemesterCreditsAfterSwap = currentSemesterCourses.fold(0, (sum, course) => 
        sum + (course.id == currentCourse.id ? targetCourse.credits : course.credits));
    
    final targetSemesterCreditsAfterSwap = targetSemesterCourses.fold(0, (sum, course) => 
        sum + (course.id == targetCourse.id ? currentCourse.credits : course.credits));
    
    if (_enforceMaxCredits) {
      if (currentSemesterCreditsAfterSwap > _maxCreditsPerSemester) {
        return {'canSwap': false, 'reason': '$currentSemester would exceed credit limit'};
      }
      if (targetSemesterCreditsAfterSwap > _maxCreditsPerSemester) {
        return {'canSwap': false, 'reason': '$targetSemester would exceed credit limit'};
      }
    }
    
    // Check class limits
    if (_enforceMaxClasses) {
      // Class count stays the same since we're swapping, not adding
      // So no need to check class limits
    }
    
    // Check prerequisites (simplified)
    if (!_checkPrerequisitesForSwap(currentCourse, targetSemester) ||
        !_checkPrerequisitesForSwap(targetCourse, currentSemester)) {
      return {'canSwap': false, 'reason': 'Prerequisites not met after swap'};
    }
    
    return {'canSwap': true, 'reason': null};
  }

  bool _checkPrerequisitesForSwap(PlannedCourse course, String newSemester) {
    // Simplified prerequisite checking
    // In a real implementation, you'd check if required prerequisite courses
    // are scheduled before the new semester
    
    // Example: COP 3330 requires COP 3223C
    if (course.code == 'COP 3330') {
      return _hasPrerequisite('COP 3223C', newSemester);
    }
    
    // Most courses don't have complex prerequisites in this example
    return true;
  }

  void _confirmScheduleSwap(PlannedCourse currentCourse, PlannedCourse targetCourse, String targetSemester) {
    // Find current semester
    String currentSemester = '';
    for (var entry in semesterCourses.entries) {
      if (entry.value.any((course) => course.id == currentCourse.id)) {
        currentSemester = entry.key;
        break;
      }
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.swap_horiz_rounded, color: AppColors.minorPrimary),
            SizedBox(width: 8),
            Text('Confirm Course Swap'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This will swap the positions of these courses:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            
            // Current course info
            Row(
              children: [
                Text('From $currentSemester:', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.errorRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.errorRed.withOpacity(0.3)),
              ),
              child: Text(
                '${currentCourse.code} - ${currentCourse.title}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Arrow
            Center(
              child: Icon(
                Icons.swap_vert_rounded,
                color: AppColors.minorPrimary,
                size: 32,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Target course info
            Row(
              children: [
                Text('From $targetSemester:', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.successGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.successGreen.withOpacity(0.3)),
              ),
              child: Text(
                '${targetCourse.code} - ${targetCourse.title}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              _performScheduleSwap(currentCourse, targetCourse, currentSemester, targetSemester);
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close swap modal
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.minorPrimary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Confirm Swap'),
          ),
        ],
      ),
    );
  }

  void _performScheduleSwap(PlannedCourse currentCourse, PlannedCourse targetCourse, String currentSemester, String targetSemester) {
    setState(() {
      // Remove both courses from their current semesters
      semesterCourses[currentSemester]!.removeWhere((c) => c.id == currentCourse.id);
      semesterCourses[targetSemester]!.removeWhere((c) => c.id == targetCourse.id);
      
      // Add them to their new semesters (swapped)
      semesterCourses[targetSemester]!.add(currentCourse);
      semesterCourses[currentSemester]!.add(targetCourse);
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Swapped ${currentCourse.code} ↔ ${targetCourse.code}'),
        backgroundColor: AppColors.successGreen,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            // Undo the swap
            setState(() {
              semesterCourses[currentSemester]!.removeWhere((c) => c.id == targetCourse.id);
              semesterCourses[targetSemester]!.removeWhere((c) => c.id == currentCourse.id);
              semesterCourses[currentSemester]!.add(currentCourse);
              semesterCourses[targetSemester]!.add(targetCourse);
            });
          },
        ),
      ),
    );
  }

  Widget _buildCompatibleCoursesList(PlannedCourse currentCourse) {
    // Get compatible courses from catalogs
    final compatibleCourses = _getCompatibleCourses(currentCourse);
    
    if (compatibleCourses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 64,
              color: AppColors.textLight,
            ),
            const SizedBox(height: 16),
            Text(
              'No compatible courses found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This course has specific requirements that\ncannot be substituted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: compatibleCourses.length,
      itemBuilder: (context, index) {
        final course = compatibleCourses[index];
        return _buildCompatibleCourseCard(course, currentCourse);
      },
    );
  }

  Widget _buildCompatibleCourseCard(Map<String, dynamic> catalogCourse, PlannedCourse currentCourse) {
    final code = catalogCourse['code'] as String;
    final title = catalogCourse['title'] as String;
    final credits = catalogCourse['credits'] as int;
    final requirements = List<String>.from(catalogCourse['fulfills'] ?? []);
    final department = catalogCourse['department'] as String;
    final prerequisites = List<String>.from(catalogCourse['prerequisites'] ?? []);
    
    // Check if prerequisites are met
    final prereqsMet = _arePrerequisitesMet(prerequisites);
    final isInCurrentSchedule = _isInCurrentSchedule(code);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: prereqsMet ? AppColors.divider : AppColors.errorRed.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.getCourseColor(requirements.isNotEmpty ? requirements.first : ''),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCourseIconFromDepartment(department),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          '$code - $title',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: prereqsMet ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '$credits credits • $department',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            if (requirements.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                requirements.join(', '),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textLight,
                ),
              ),
            ],
            if (!prereqsMet) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 14,
                    color: AppColors.warningAmber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Prerequisites not met',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.warningAmber,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
            if (isInCurrentSchedule) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 14,
                    color: AppColors.infoBlue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Already in schedule',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.infoBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing: ElevatedButton(
          onPressed: prereqsMet && !isInCurrentSchedule 
            ? () => _confirmSwapCourse(currentCourse, catalogCourse)
            : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: prereqsMet ? AppColors.majorPrimary : AppColors.textLight,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Swap',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  // 🔍 HELPER METHODS FOR SWAP FUNCTIONALITY

  List<Map<String, dynamic>> _getCompatibleCourses(PlannedCourse currentCourse) {
    // This is where you'll integrate with your actual course catalogs
    // For now, returning mock data - you'll replace this with real catalog lookups
    
    final compatible = <Map<String, dynamic>>[];
    
    // Example: If it's a Major Core course, find other Major Core courses
    if (currentCourse.requirements.contains('Major (Core)')) {
      compatible.addAll([
        {
          'code': 'PLA 3108',
          'title': 'Legal Research',
          'credits': 3,
          'fulfills': ['Major Core'],
          'department': 'Legal Studies',
          'prerequisites': ['POS 2041'],
        },
        {
          'code': 'POS 3413',
          'title': 'The American Presidency',
          'credits': 3,
          'fulfills': ['Major Core'],
          'department': 'Political Science',
          'prerequisites': ['POS 2041'],
        },
      ]);
    }
    
    // Example: If it's a CODE Minor course, find other CODE Minor courses
    if (currentCourse.requirements.contains('CODE Minor')) {
      compatible.addAll([
        {
          'code': 'CIS 3360',
          'title': 'Security in Computing',
          'credits': 3,
          'fulfills': ['CODE Minor CS'],
          'department': 'Computer Science',
          'prerequisites': ['COP 3223C'],
        },
        {
          'code': 'STA 4345',
          'title': 'Applied Bayesian Statistics',
          'credits': 3,
          'fulfills': ['CODE Minor Technical'],
          'department': 'Statistics',
          'prerequisites': ['STA 2023', 'STA 3024'],
        },
      ]);
    }
    
    return compatible;
  }

  bool _arePrerequisitesMet(List<String> prerequisites) {
    // Check against completed courses
    // For now, assume prerequisites are met - you'll implement actual checking
    return true;
  }

  bool _isInCurrentSchedule(String courseCode) {
    // Check if course is already in any semester
    for (var courses in semesterCourses.values) {
      if (courses.any((course) => course.code == courseCode)) {
        return true;
      }
    }
    return false;
  }

  void _confirmSwapCourse(PlannedCourse currentCourse, Map<String, dynamic> newCourseData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.swap_horizontal_circle_rounded, color: AppColors.majorPrimary),
            SizedBox(width: 8),
            Text('Confirm Course Swap'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Replace this course:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.errorRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.errorRed.withOpacity(0.3)),
              ),
              child: Text(
                '${currentCourse.code} - ${currentCourse.title}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            Text('With this course:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.successGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.successGreen.withOpacity(0.3)),
              ),
              child: Text(
                '${newCourseData['code']} - ${newCourseData['title']}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              _performSwap(currentCourse, newCourseData);
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close swap modal
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.majorPrimary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Confirm Swap'),
          ),
        ],
      ),
    );
  }

  void _performSwap(PlannedCourse currentCourse, Map<String, dynamic> newCourseData) {
    setState(() {
      // Find current course and replace it
      for (var semester in semesterCourses.keys) {
        for (int i = 0; i < semesterCourses[semester]!.length; i++) {
          if (semesterCourses[semester]![i].id == currentCourse.id) {
            // Create new course from catalog data
            final newCourse = PlannedCourse(
              id: newCourseData['code'],
              code: newCourseData['code'],
              title: newCourseData['title'],
              credits: newCourseData['credits'],
              requirements: List<String>.from(newCourseData['fulfills']),
              isNewlyAdded: true, // Mark as newly added
            );
            
            // Replace the course
            semesterCourses[semester]![i] = newCourse;
            break;
          }
        }
      }
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Swapped ${currentCourse.code} → ${newCourseData['code']}'),
        backgroundColor: AppColors.successGreen,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // 🎨 HELPER METHODS FOR ICONS AND STYLING

  IconData _getCourseIcon(PlannedCourse course) {
    if (course.requirements.isEmpty) return Icons.school_rounded;
    
    final req = course.requirements.first.toLowerCase();
    if (req.contains('major')) return Icons.account_balance_rounded;
    if (req.contains('code') || req.contains('minor')) return Icons.code_rounded;
    if (req.contains('certificate') || req.contains('law')) return Icons.gavel_rounded;
    if (req.contains('honors')) return Icons.auto_awesome_rounded;
    return Icons.school_rounded;
  }

  IconData _getCourseIconFromDepartment(String department) {
    switch (department.toLowerCase()) {
      case 'political science':
      case 'legal studies':
        return Icons.account_balance_rounded;
      case 'computer science':
        return Icons.code_rounded;
      case 'mathematics':
      case 'statistics':
        return Icons.calculate_rounded;
      case 'history':
        return Icons.history_edu_rounded;
      case 'philosophy':
        return Icons.psychology_rounded;
      default:
        return Icons.school_rounded;
    }
  }

  String _getCourseDescription(PlannedCourse course) {
    // You can add actual course descriptions here or fetch from catalogs
    return 'Course description will be loaded from the course catalog. This course fulfills: ${course.requirements.join(', ')}.';
  }

  // 🔄 ADDITIONAL ACTION METHODS

  void _moveCourseToSemester(PlannedCourse course) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Move Course feature - Coming soon!'),
        backgroundColor: AppColors.infoBlue,
      ),
    );
  }

  void _removeCourse(PlannedCourse course) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_rounded, color: AppColors.warningAmber),
            SizedBox(width: 8),
            Text('Remove Course'),
          ],
        ),
        content: Text('Are you sure you want to remove ${course.code} from your schedule?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Remove course from schedule
                for (var semester in semesterCourses.keys) {
                  semesterCourses[semester]!.removeWhere((c) => c.id == course.id);
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${course.code} removed from schedule'),
                  backgroundColor: AppColors.warningAmber,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
              foregroundColor: Colors.white,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _showAddCourseDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add Course feature - Coming in next update!'),
        backgroundColor: AppColors.majorPrimary,
      ),
    );
  }

  void _exportSchedule() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Export Schedule feature - Coming in next update!'),
        backgroundColor: AppColors.majorPrimary,
      ),
    );
  }
}

// 📚 COURSE DATA MODEL
class PlannedCourse {
  final String id;
  final String code;
  final String title;
  final int credits;
  final List<String> requirements;
  final bool isCompleted;
  final String? grade;
  final bool isNewlyAdded;
  final bool isCapstone;

  PlannedCourse({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.requirements,
    this.isCompleted = false,
    this.grade,
    this.isNewlyAdded = false,
    this.isCapstone = false,
  });
}