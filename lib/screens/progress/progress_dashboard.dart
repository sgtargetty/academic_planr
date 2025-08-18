// 📊 Progress Dashboard with Forecaster Integration
// Replace your lib/screens/progress/progress_dashboard.dart with this

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../utils/colors.dart';

class ProgressDashboard extends StatefulWidget {
  const ProgressDashboard({super.key});

  @override
  State<ProgressDashboard> createState() => _ProgressDashboardState();
}

class _ProgressDashboardState extends State<ProgressDashboard> {
  // 🔮 FORECASTER STATE (replicated from schedule screen)
  String? _forecastToSemester;
  Map<String, String> _forecastedGrades = {}; // courseId -> grade
  bool _isForecasting = false;

  // 📚 COURSE DATA (you'll need to import this from your schedule screen or create a shared data service)
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Graduation Progress Overview
            _buildGraduationOverview(),
            
            const SizedBox(height: 24),
            
            // Program Progress Cards
            _buildProgramProgress(),
            
            const SizedBox(height: 24),
            
            // Detailed Requirements
            _buildDetailedRequirements(),
            
            const SizedBox(height: 24),
            
            // GPA & Academic Standing
            _buildGpaSection(),
            
            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_isForecasting ? 'Progress Forecast' : 'Progress Dashboard'),
      backgroundColor: _isForecasting ? AppColors.infoBlue : AppColors.minorPrimary,
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
          icon: const Icon(Icons.info_outline_rounded),
          onPressed: _showProgressInfo,
          tooltip: 'Progress Info',
        ),
      ],
    );
  }

  Widget _buildGraduationOverview() {
    final progressData = _calculateOverallProgress();
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: _isForecasting ? 
          LinearGradient(
            colors: [AppColors.infoBlue, AppColors.infoBlue.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ) :
          AppColors.majorGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Overall Progress Ring
              CircularPercentIndicator(
                radius: 60,
                lineWidth: 8,
                animation: true,
                animationDuration: 1200,
                percent: progressData['overall_percentage'] / 100,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${progressData['overall_percentage'].round()}%',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Complete',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                progressColor: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.3),
              ),
              
              const SizedBox(width: 24),
              
              // Progress Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_isForecasting) ...[
                      Row(
                        children: [
                          const Icon(Icons.insights_rounded, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Forecasting to $_forecastToSemester',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    Text(
                      'Graduation Progress',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildProgressStat('Credits', '${progressData['credits']}/120', Icons.school_rounded),
                    _buildProgressStat('Upper Level', '${progressData['upper_level']}/42', Icons.trending_up_rounded),
                    _buildProgressStat('Cumulative GPA', progressData['gpa'].toStringAsFixed(2), Icons.grade_rounded),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Graduation Status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  _getGraduationStatusIcon(progressData['graduation_status']),
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        progressData['graduation_status'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        progressData['graduation_message'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!_isForecasting)
                  ElevatedButton.icon(
                    onPressed: _showForecaster,
                    icon: const Icon(Icons.insights_rounded, size: 16),
                    label: const Text('Forecast'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStat(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Program Progress',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        // Major Progress
        _buildProgramCard(
          title: 'Political Science B.A.',
          subtitle: 'Major Degree Requirements',
          icon: Icons.account_balance_rounded,
          color: AppColors.majorPrimary,
          progress: _calculateProgramProgress('Major'),
        ),
        
        const SizedBox(height: 12),
        
        // Minor Progress
        _buildProgramCard(
          title: 'CODE Minor',
          subtitle: 'AI/ML Focus Track',
          icon: Icons.code_rounded,
          color: AppColors.minorPrimary,
          progress: _calculateProgramProgress('CODE Minor'),
        ),
        
        const SizedBox(height: 12),
        
        // Certificate Progress
        _buildProgramCard(
          title: 'Tech & Law Certificate',
          subtitle: 'Law-Centered Track',
          icon: Icons.gavel_rounded,
          color: AppColors.certPrimary,
          progress: _calculateProgramProgress('Certificate'),
        ),
        
        const SizedBox(height: 12),
        
        // Honors Progress
        _buildProgramCard(
          title: 'Honors Program',
          subtitle: '3 Honors Courses Required',
          icon: Icons.auto_awesome_rounded,
          color: AppColors.honorsGold,
          progress: _calculateProgramProgress('Honors'),
        ),
      ],
    );
  }

  Widget _buildProgramCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Map<String, dynamic> progress,
  }) {
    final percentage = progress['percentage'] as double;
    final completed = progress['completed'] as int;
    final total = progress['total'] as int;
    final courses = progress['courses'] as List<String>;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$completed/$total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Progress Bar
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 8,
            percent: percentage / 100,
            backgroundColor: color.withOpacity(0.2),
            progressColor: color,
            barRadius: const Radius.circular(4),
          ),
          
          const SizedBox(height: 12),
          
          // Course Progress
          if (courses.isNotEmpty) ...[
            Text(
              'Recent Courses:',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: courses.take(6).map((courseCode) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withOpacity(0.3)),
                ),
                child: Text(
                  courseCode,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              )).toList(),
            ),
            if (courses.length > 6)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '+${courses.length - 6} more...',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textLight,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailedRequirements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Graduation Requirements',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        _buildRequirementItem(
          'Total Credits',
          '120 credits required for graduation',
          _getCreditsProgress(),
          Icons.school_rounded,
          AppColors.majorPrimary,
        ),
        
        _buildRequirementItem(
          'Upper Level Credits',
          '42 upper level (3000+) credits required',
          _getUpperLevelProgress(),
          Icons.trending_up_rounded,
          AppColors.minorPrimary,
        ),
        
        _buildRequirementItem(
          'Cumulative GPA',
          'Minimum 2.0 GPA required for graduation',
          _getGpaProgress(),
          Icons.grade_rounded,
          AppColors.certPrimary,
        ),
        
        _buildRequirementItem(
          'Residency Requirement',
          '30 of last 60 credits must be at UCF',
          {'completed': 30, 'total': 30, 'percentage': 100.0}, // Assume met
          Icons.home_rounded,
          AppColors.successGreen,
        ),
      ],
    );
  }

  Widget _buildRequirementItem(
    String title,
    String description,
    Map<String, dynamic> progress,
    IconData icon,
    Color color,
  ) {
    final percentage = progress['percentage'] as double;
    final completed = progress['completed'];
    final total = progress['total'];
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 6,
                  percent: percentage / 100,
                  backgroundColor: AppColors.divider,
                  progressColor: color,
                  barRadius: const Radius.circular(3),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${percentage.round()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                '$completed/$total',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGpaSection() {
    final gpaData = _calculateGpaData();
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
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
          Text(
            'Academic Standing',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            children: [
              // GPA Ring
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 6,
                animation: true,
                percent: gpaData['gpa'] / 4.0,
                center: Text(
                  gpaData['gpa'].toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getGpaColor(gpaData['gpa']),
                  ),
                ),
                progressColor: AppColors.getGpaColor(gpaData['gpa']),
                backgroundColor: AppColors.divider,
              ),
              
              const SizedBox(width: 20),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cumulative GPA',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      gpaData['status'],
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.getGpaColor(gpaData['gpa']),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Based on ${gpaData['credits_counted']} credits',
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
        ],
      ),
    );
  }

  // 📊 CALCULATION METHODS
  
  Map<String, dynamic> _calculateOverallProgress() {
    final semesters = semesterCourses.keys.toList();
    final forecastIndex = _forecastToSemester != null 
      ? semesters.indexOf(_forecastToSemester!) 
      : 0; // Only Summer 2025 if not forecasting
    
    int totalCredits = 0;
    int upperLevelCredits = 0;
    double totalGradePoints = 0;
    int creditsCounted = 0;
    
    // Calculate progress up to forecast semester
    for (int i = 0; i <= forecastIndex; i++) {
      final semester = semesters[i];
      for (var course in semesterCourses[semester]!) {
        totalCredits += course.credits;
        
        // Count upper level credits (3000+ courses)
        if (_isUpperLevel(course.code)) {
          upperLevelCredits += course.credits;
        }
        
        // GPA calculation
        String? grade;
        if (course.isCompleted && course.grade != null) {
          grade = course.grade;
        } else if (_isForecasting && _forecastedGrades.containsKey(course.id)) {
          grade = _forecastedGrades[course.id];
        }
        
        if (grade != null) {
          totalGradePoints += _gradeToGPA(grade) * course.credits;
          creditsCounted += course.credits;
        }
      }
    }
    
    final gpa = creditsCounted > 0 ? totalGradePoints / creditsCounted : 0.0;
    final overallPercentage = (totalCredits / 120 * 100).clamp(0, 100);
    
    // Determine graduation status
    String graduationStatus;
    String graduationMessage;
    
    if (totalCredits >= 120 && upperLevelCredits >= 42 && gpa >= 2.0) {
      graduationStatus = 'Ready to Graduate!';
      graduationMessage = 'All requirements met';
    } else if (totalCredits >= 90) {
      graduationStatus = 'On Track';
      graduationMessage = 'Approaching graduation requirements';
    } else if (totalCredits >= 60) {
      graduationStatus = 'Progressing Well';
      graduationMessage = 'Halfway to graduation';
    } else {
      graduationStatus = 'Getting Started';
      graduationMessage = 'Building foundation';
    }
    
    return {
      'overall_percentage': overallPercentage,
      'credits': totalCredits,
      'upper_level': upperLevelCredits,
      'gpa': gpa,
      'graduation_status': graduationStatus,
      'graduation_message': graduationMessage,
    };
  }

  Map<String, dynamic> _calculateProgramProgress(String program) {
    final allCourses = <String>[];
    final completedCourses = <String>[];
    
    // Count courses for this program
    for (var semester in semesterCourses.values) {
      for (var course in semester) {
        bool belongsToProgram = false;
        
        switch (program) {
          case 'Major':
            belongsToProgram = course.requirements.any((req) => req.contains('Major'));
            break;
          case 'CODE Minor':
            belongsToProgram = course.requirements.any((req) => req.contains('CODE Minor'));
            break;
          case 'Certificate':
            belongsToProgram = course.requirements.any((req) => req.contains('Certificate'));
            break;
          case 'Honors':
            belongsToProgram = course.requirements.any((req) => req.contains('Honors'));
            break;
        }
        
        if (belongsToProgram) {
          allCourses.add(course.code);
          
          // Check if completed (either actually completed or forecasted)
          if (course.isCompleted || 
              (_isForecasting && _forecastedGrades.containsKey(course.id))) {
            completedCourses.add(course.code);
          }
        }
      }
    }
    
    final percentage = allCourses.isNotEmpty 
      ? (completedCourses.length / allCourses.length * 100) 
      : 0.0;
    
    return {
      'percentage': percentage,
      'completed': completedCourses.length,
      'total': allCourses.length,
      'courses': completedCourses,
    };
  }

  Map<String, dynamic> _getCreditsProgress() {
    final overallProgress = _calculateOverallProgress();
    return {
      'completed': overallProgress['credits'],
      'total': 120,
      'percentage': (overallProgress['credits'] / 120 * 100).clamp(0, 100),
    };
  }

  Map<String, dynamic> _getUpperLevelProgress() {
    final overallProgress = _calculateOverallProgress();
    return {
      'completed': overallProgress['upper_level'],
      'total': 42,
      'percentage': (overallProgress['upper_level'] / 42 * 100).clamp(0, 100),
    };
  }

  Map<String, dynamic> _getGpaProgress() {
    final overallProgress = _calculateOverallProgress();
    final gpa = overallProgress['gpa'] as double;
    return {
      'completed': gpa,
      'total': 4.0,
      'percentage': (gpa / 4.0 * 100).clamp(0, 100),
    };
  }

  Map<String, dynamic> _calculateGpaData() {
    final overallProgress = _calculateOverallProgress();
    final gpa = overallProgress['gpa'] as double;
    
    String status;
    if (gpa >= 3.7) {
      status = 'Excellent (Summa Cum Laude)';
    } else if (gpa >= 3.5) {
      status = 'Very Good (Magna Cum Laude)';
    } else if (gpa >= 3.25) {
      status = 'Good (Cum Laude)';
    } else if (gpa >= 2.0) {
      status = 'Satisfactory';
    } else {
      status = 'Below Minimum';
    }
    
    return {
      'gpa': gpa,
      'status': status,
      'credits_counted': _getGpaCreditsCounted(),
    };
  }

  int _getGpaCreditsCounted() {
    int creditsCounted = 0;
    
    for (var semester in semesterCourses.values) {
      for (var course in semester) {
        if (course.isCompleted || 
            (_isForecasting && _forecastedGrades.containsKey(course.id))) {
          creditsCounted += course.credits;
        }
      }
    }
    
    return creditsCounted;
  }

  bool _isUpperLevel(String courseCode) {
    if (courseCode.length < 4) return false;
    final courseNumber = int.tryParse(courseCode.substring(4, 5)) ?? 0;
    return courseNumber >= 3;
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
        return 4.0;
    }
  }

  IconData _getGraduationStatusIcon(String status) {
    if (status.contains('Ready')) return Icons.celebration_rounded;
    if (status.contains('On Track')) return Icons.trending_up_rounded;
    if (status.contains('Progressing')) return Icons.schedule_rounded;
    return Icons.play_circle_rounded;
  }

  // 🔮 FORECASTER METHODS (simplified versions)
  
  void _showForecaster() {
    // Show simplified forecaster for progress dashboard
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildProgressForecaster(),
    );
  }

  Widget _buildProgressForecaster() {
    final semesters = semesterCourses.keys.toList();
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Progress Forecaster',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Select semester to forecast progress',
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
                ),
              ],
            ),
          ),
          
          // Semester selector
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: semesters.length,
              itemBuilder: (context, index) {
                final semester = semesters[index];
                final isCompleted = semester == 'Summer 2025';
                final isSelected = _forecastToSemester == semester;
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected 
                          ? AppColors.infoBlue
                          : isCompleted 
                            ? AppColors.completed.withOpacity(0.1)
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isCompleted ? Icons.check_circle : Icons.schedule,
                        color: isSelected 
                          ? Colors.white
                          : isCompleted 
                            ? AppColors.completed
                            : AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      semester,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? AppColors.infoBlue : AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Text(
                      isCompleted 
                        ? 'Completed'
                        : '${semesterCourses[semester]!.length} courses',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    trailing: isSelected 
                      ? const Icon(Icons.check, color: AppColors.infoBlue)
                      : null,
                    onTap: isCompleted ? null : () {
                      setState(() {
                        _forecastToSemester = semester;
                        _isForecasting = true;
                        // Set default grades to A for simplicity
                        for (int i = 1; i <= index; i++) {
                          final sem = semesters[i];
                          for (var course in semesterCourses[sem]!) {
                            _forecastedGrades[course.id] = 'A';
                          }
                        }
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _exitForecastMode() {
    setState(() {
      _isForecasting = false;
      _forecastToSemester = null;
      _forecastedGrades.clear();
    });
  }

  void _showProgressInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info_outline_rounded, color: AppColors.infoBlue),
            SizedBox(width: 8),
            Text('Progress Information'),
          ],
        ),
        content: const Text(
          'This dashboard shows your progress toward graduation requirements:\n\n'
          '• Overall progress toward 120 credit degree\n'
          '• Individual program completion status\n'
          '• GPA tracking and academic standing\n'
          '• Graduation requirement fulfillment\n\n'
          'Use the forecaster to see how different grades would affect your progress.',
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
}

// 📚 COURSE DATA MODEL (if not already defined)
class PlannedCourse {
  final String id;
  final String code;
  final String title;
  final int credits;
  final List<String> requirements;
  final bool isCompleted;
  final String? grade;
  final bool isCapstone;

  PlannedCourse({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.requirements,
    this.isCompleted = false,
    this.grade,
    this.isCapstone = false,
  });
}