// ✅ Summer 2025 Completed Courses
// Your actual completed courses with grades and requirements fulfilled

import '../../../models/course.dart';

class Summer2025Completed {
  // 🎓 COMPLETED COURSES LIST
  static final List<CompletedCourse> courses = [
    CompletedCourse(
      id: 'CPO3034_S25',
      code: 'CPO 3034',
      title: 'Politics of Developing Areas',
      credits: 3,
      grade: 'A',        // Update with your actual grade
      gpa: 4.0,          // Update with actual GPA value
      semester: 'Summer 2025',
      requirements: [
        'Major (Area B)',
        'Upper Level Credit'
      ],
      status: CourseStatus.completed,
      completedDate: DateTime(2025, 8, 1),
    ),
    
    CompletedCourse(
      id: 'GEO3471_S25',
      code: 'GEO 3471',
      title: 'World Political Geography',
      credits: 3,
      grade: 'A-',       // Update with your actual grade
      gpa: 3.7,          // Update with actual GPA value
      semester: 'Summer 2025',
      requirements: [
        'Major (Area C)',
        'Upper Level Credit'
      ],
      status: CourseStatus.completed,
      completedDate: DateTime(2025, 8, 1),
    ),
    
    CompletedCourse(
      id: 'PLA4410_S25',
      code: 'PLA 4410',
      title: 'Intellectual Property Law',
      credits: 3,
      grade: 'A',        // Update with your actual grade
      gpa: 4.0,          // Update with actual GPA value
      semester: 'Summer 2025',
      requirements: [
        'Major (Core)',
        'Tech & Law Certificate',
        'Upper Level Credit'
      ],
      status: CourseStatus.completed,
      completedDate: DateTime(2025, 8, 1),
      isOverlapCourse: true, // Satisfies multiple requirements
    ),
    
    CompletedCourse(
      id: 'POS3424_S25',
      code: 'POS 3424',
      title: 'Congress & Legislative Process',
      credits: 3,
      grade: 'A+',       // Update with your actual grade
      gpa: 4.0,          // Update with actual GPA value
      semester: 'Summer 2025',
      requirements: [
        'Major (Core)',
        'Upper Level Credit'
      ],
      status: CourseStatus.completed,
      completedDate: DateTime(2025, 8, 1),
    ),
  ];

  // 📊 SEMESTER SUMMARY
  static SemesterSummary get semesterSummary => SemesterSummary(
    semester: 'Summer 2025',
    totalCredits: 12,
    completedCredits: 12,
    gpa: _calculateSemesterGPA(),
    status: SemesterStatus.completed,
    courses: courses,
    requirementsFulfilled: [
      'Major Area B - CPO 3034',
      'Major Area C - GEO 3471', 
      'Major Core - PLA 4410',
      'Major Core - POS 3424',
      'Tech & Law Certificate - PLA 4410',
      'Upper Level Credits: 12/42'
    ],
  );

  // 🎯 REQUIREMENTS PROGRESS
  static Map<String, RequirementProgress> get requirementsProgress => {
    'Major Core': RequirementProgress(
      category: 'Major Core',
      completed: 2,  // PLA 4410, POS 3424
      required: 6,   // Based on Political Science requirements
      percentage: 33.3,
      courses: ['PLA 4410', 'POS 3424'],
      remaining: ['POS 3703', 'PLA 3108', 'POS 3413', 'POS 4284'],
    ),
    
    'Major Area A': RequirementProgress(
      category: 'Major Area A',
      completed: 0,
      required: 2,   // 6 credits minimum (2 courses)
      percentage: 0,
      courses: [],
      remaining: ['CPO 3103', 'POS 4284'],
    ),
    
    'Major Area B': RequirementProgress(
      category: 'Major Area B',
      completed: 1,  // CPO 3034
      required: 2,   // 6 credits minimum (2 courses)
      percentage: 50.0,
      courses: ['CPO 3034'],
      remaining: ['Choose 1 more from Area B list'],
    ),
    
    'Major Area C': RequirementProgress(
      category: 'Major Area C',
      completed: 1,  // GEO 3471
      required: 1,   // 3 credits minimum (1 course)
      percentage: 100.0,
      courses: ['GEO 3471'],
      remaining: [],
    ),
    
    'Tech & Law Certificate': RequirementProgress(
      category: 'Tech & Law Certificate',
      completed: 1,  // PLA 4410
      required: 5,   // 15 credits total (5 courses)
      percentage: 20.0,
      courses: ['PLA 4410'],
      remaining: ['PLA 4585', 'HIS 3462', 'PLA 3871', 'PHI 3626'],
    ),
    
    'CODE Minor': RequirementProgress(
      category: 'CODE Minor',
      completed: 0,
      required: 6,   // 18 credits total (6 courses)
      percentage: 0,
      courses: [],
      remaining: ['COP 2500C', 'COP 3223C', 'COP 3330', 'STA 4364', 'STA 4241', 'MAP 4112'],
    ),
    
    'Honors Requirements': RequirementProgress(
      category: 'Honors Requirements',
      completed: 0,
      required: 3,   // 3 honors courses
      percentage: 0,
      courses: [],
      remaining: ['Spring 2026 Honors', 'Summer 2026 Honors', 'Fall 2026 Honors'],
    ),
  };

  // 🧮 HELPER METHODS
  static double _calculateSemesterGPA() {
    double totalPoints = 0;
    int totalCredits = 0;
    
    for (var course in courses) {
      totalPoints += course.gpa * course.credits;
      totalCredits += course.credits;
    }
    
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }

  static int get totalCreditsCompleted => courses.fold(0, (sum, course) => sum + course.credits);
  
  static double get cumulativeGPA => _calculateSemesterGPA();

  static List<String> get satisfiedRequirements => courses
      .expand((course) => course.requirements)
      .toSet()
      .toList();

  static bool hasCompletedRequirement(String requirement) {
    return satisfiedRequirements.any((req) => req.contains(requirement));
  }

  // 🎯 T14 LAW SCHOOL PREPARATION METRICS
  static Map<String, dynamic> get lawSchoolMetrics => {
    'current_gpa': cumulativeGPA,
    'credits_completed': totalCreditsCompleted,
    'upper_level_credits': 12, // All Summer 2025 courses are upper level
    'law_related_courses': courses.where((c) => 
      c.requirements.any((r) => r.contains('Law') || r.contains('Legal'))).length,
    'research_experience': courses.where((c) => 
      c.title.contains('Research')).length,
    'interdisciplinary_focus': true, // Tech + Law combination
    'honors_program': true,
    'on_track_for_graduation': true,
  };

  // 🏆 ACHIEVEMENTS UNLOCKED
  static List<String> get achievements => [
    '🎓 Summer 2025 Semester Completed',
    '📚 12 Credits Earned',
    '⭐ Strong GPA Foundation',
    '🏛️ Political Science Major Started',
    '⚖️ Legal Studies Foundation (IP Law)',
    '🌍 International/Comparative Focus (Area B & C)',
    '📊 Upper Level Credits: 12/42',
    '🎯 On Track for T14 Law School Preparation',
  ];
}

// 📋 DATA MODELS (these will be defined in the models files)
class CompletedCourse {
  final String id;
  final String code;
  final String title;
  final int credits;
  final String grade;
  final double gpa;
  final String semester;
  final List<String> requirements;
  final CourseStatus status;
  final DateTime completedDate;
  final bool isOverlapCourse;

  CompletedCourse({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.grade,
    required this.gpa,
    required this.semester,
    required this.requirements,
    required this.status,
    required this.completedDate,
    this.isOverlapCourse = false,
  });
}

class SemesterSummary {
  final String semester;
  final int totalCredits;
  final int completedCredits;
  final double gpa;
  final SemesterStatus status;
  final List<CompletedCourse> courses;
  final List<String> requirementsFulfilled;

  SemesterSummary({
    required this.semester,
    required this.totalCredits,
    required this.completedCredits,
    required this.gpa,
    required this.status,
    required this.courses,
    required this.requirementsFulfilled,
  });
}

class RequirementProgress {
  final String category;
  final int completed;
  final int required;
  final double percentage;
  final List<String> courses;
  final List<String> remaining;

  RequirementProgress({
    required this.category,
    required this.completed,
    required this.required,
    required this.percentage,
    required this.courses,
    required this.remaining,
  });
}

enum CourseStatus { completed, inProgress, planned, notStarted }
enum SemesterStatus { completed, current, upcoming }