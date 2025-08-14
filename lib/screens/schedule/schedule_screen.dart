// 📅 Enhanced Interactive Schedule Screen with Smart Limits & Better UX
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
      title: const Text('Course Schedule'),
      backgroundColor: AppColors.majorPrimary,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
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

  Widget _buildCourseDetailsSheet(PlannedCourse course) {
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
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                const SizedBox(height: 8),
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
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
              ],
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