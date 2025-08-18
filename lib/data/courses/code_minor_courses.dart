// 💻 CODE Minor Course Catalog - Using CatalogCourse Format
// 18-21 credits: 3 CS courses + 3 Technical Application courses

class CatalogCourse {
  final String id;
  final String code;
  final String title;
  final int credits;
  final List<String> fulfills; // What requirements this satisfies
  final List<String> prerequisites;
  final String description;
  final String department;
  final bool isUpperLevel;
  final List<String>? tags; // Optional: for filtering (AI, ML, etc.)

  CatalogCourse({
    required this.id,
    required this.code,
    required this.title,
    required this.credits,
    required this.fulfills,
    this.prerequisites = const [],
    this.description = '',
    required this.department,
    required this.isUpperLevel,
    this.tags,
  });
}

class CODEMinorCatalog {
  
  // 💻 COMPUTER SCIENCE COURSES (Choose 3 of 5)
  static final List<CatalogCourse> computerScienceCourses = [
    CatalogCourse(
      id: 'COP2500C',
      code: 'COP 2500C',
      title: 'Concepts in Computer Science',
      credits: 3,
      fulfills: ['CODE Minor CS'],
      description: 'Introduction to computer science principles, problem-solving, and basic programming concepts.',
      department: 'Computer Science',
      isUpperLevel: false,
    ),
    
    CatalogCourse(
      id: 'COP3223C',
      code: 'COP 3223C',
      title: 'Introduction to Programming with C',
      credits: 3,
      fulfills: ['CODE Minor CS'],
      prerequisites: ['COP 2500C or AP Computer Science or CSPT'],
      description: 'Fundamental programming concepts using C language including data structures and algorithms.',
      department: 'Computer Science',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'COP3330',
      code: 'COP 3330',
      title: 'Object Oriented Programming',
      credits: 3,
      fulfills: ['CODE Minor CS'],
      prerequisites: ['COP 3223C'],
      description: 'Object-oriented programming principles, design patterns, and software development practices.',
      department: 'Computer Science',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'CIS3360',
      code: 'CIS 3360',
      title: 'Security in Computing',
      credits: 3,
      fulfills: ['CODE Minor CS'],
      prerequisites: ['COP 3223C'],
      description: 'Computer security principles, cryptography, network security, and ethical hacking.',
      department: 'Computer Science',
      isUpperLevel: true,
      tags: ['Security', 'Cybersecurity'],
    ),
    
    CatalogCourse(
      id: 'COP3502C',
      code: 'COP 3502C',
      title: 'Computer Science I',
      credits: 3,
      fulfills: ['CODE Minor CS'],
      prerequisites: ['COP 3223C', 'MAC 1105'],
      description: 'Advanced programming, data structures, and algorithm analysis.',
      department: 'Computer Science',
      isUpperLevel: true,
    ),
  ];

  // 📊 STATISTICS COURSES (Technical Application Options)
  static final List<CatalogCourse> statisticsCourses = [
    CatalogCourse(
      id: 'STA4102',
      code: 'STA 4102',
      title: 'Computer Processing of Statistical Data',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023 or equivalent'],
      description: 'Statistical software packages, data manipulation, and computational statistics.',
      department: 'Statistics',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'STA4164',
      code: 'STA 4164',
      title: 'Statistical Methods III',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Advanced statistical methods including ANOVA, regression, and experimental design.',
      department: 'Statistics',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'STA4241',
      code: 'STA 4241',
      title: 'Statistical Learning',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Machine learning from statistical perspective: supervised/unsupervised learning, cross-validation.',
      department: 'Statistics',
      isUpperLevel: true,
      tags: ['Machine Learning', 'Data Science', 'AI'],
    ),
    
    CatalogCourse(
      id: 'STA4345',
      code: 'STA 4345',
      title: 'Applied Bayesian Statistics',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Bayesian inference, MCMC methods, and applications in data analysis.',
      department: 'Statistics',
      isUpperLevel: true,
      tags: ['Bayesian', 'Statistics'],
    ),
    
    CatalogCourse(
      id: 'STA4364',
      code: 'STA 4364',
      title: 'Statistical Foundations of Data Science and Artificial Intelligence I',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Statistical foundations for AI/ML including probability theory, inference, and model selection.',
      department: 'Statistics',
      isUpperLevel: true,
      tags: ['Data Science', 'AI', 'Machine Learning'],
    ),
    
    CatalogCourse(
      id: 'STA4504',
      code: 'STA 4504',
      title: 'Categorical Data Analysis',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Statistical methods for categorical and discrete data analysis.',
      department: 'Statistics',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'STA4852',
      code: 'STA 4852',
      title: 'Applied Time Series',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['STA 2023', 'STA 3024'],
      description: 'Time series analysis, forecasting, and temporal data modeling.',
      department: 'Statistics',
      isUpperLevel: true,
      tags: ['Time Series', 'Forecasting'],
    ),
  ];

  // 🧮 MATHEMATICS COURSES (Technical Application Options)
  static final List<CatalogCourse> mathematicsCourses = [
    CatalogCourse(
      id: 'MAP4112',
      code: 'MAP 4112',
      title: 'Mathematical Foundations of Machine Learning and Artificial Intelligence',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['MAC 2312', 'MAS 3106'],
      description: 'Linear algebra, optimization, and mathematical foundations essential for ML/AI.',
      department: 'Mathematics',
      isUpperLevel: true,
      tags: ['Machine Learning', 'AI', 'Linear Algebra'],
    ),
    
    CatalogCourse(
      id: 'MAP4191',
      code: 'MAP 4191',
      title: 'Mathematical Modeling of Data',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['MAC 2312', 'STA 2023'],
      description: 'Mathematical models for data analysis, curve fitting, and predictive modeling.',
      department: 'Mathematics',
      isUpperLevel: true,
      tags: ['Modeling', 'Data Analysis'],
    ),
    
    CatalogCourse(
      id: 'MAP4371',
      code: 'MAP 4371',
      title: 'Numerical Methods for Differential Equations',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['MAC 2313', 'MAS 3106'],
      description: 'Computational methods for solving ordinary and partial differential equations.',
      department: 'Mathematics',
      isUpperLevel: true,
      tags: ['Numerical Methods', 'Differential Equations'],
    ),
    
    CatalogCourse(
      id: 'MAP4384',
      code: 'MAP 4384',
      title: 'Numerical Methods for Computational Sciences',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['MAC 2313', 'MAS 3106'],
      description: 'Advanced numerical algorithms for scientific computing and simulation.',
      department: 'Mathematics',
      isUpperLevel: true,
      tags: ['Numerical Methods', 'Scientific Computing'],
    ),
  ];

  // 🧬 BIOLOGY COURSES (Alternative Technical Applications)
  static final List<CatalogCourse> biologyCourses = [
    CatalogCourse(
      id: 'BSC3403C',
      code: 'BSC 3403C',
      title: 'Quantitative Biological Methods',
      credits: 4,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['BSC 2010C', 'STA 2023'],
      description: 'Statistical and computational methods for biological data analysis.',
      department: 'Biology',
      isUpperLevel: true,
      tags: ['Bioinformatics', 'Quantitative Biology'],
    ),
    
    CatalogCourse(
      id: 'BSC4456C',
      code: 'BSC 4456C',
      title: 'Programming for Biologists',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['BSC 2010C'],
      description: 'Programming skills specifically for biological research and bioinformatics.',
      department: 'Biology',
      isUpperLevel: true,
      tags: ['Programming', 'Bioinformatics'],
    ),
    
    CatalogCourse(
      id: 'PCB3063',
      code: 'PCB 3063',
      title: 'Genetics',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['BSC 2010C', 'CHM 2046'],
      description: 'Principles of heredity, molecular genetics, and genomics.',
      department: 'Biology',
      isUpperLevel: true,
      tags: ['Genetics', 'Molecular Biology'],
    ),
  ];

  // 🎮 DIGITAL MEDIA COURSES (Alternative Technical Applications)
  static final List<CatalogCourse> digitalMediaCourses = [
    CatalogCourse(
      id: 'DIG3480',
      code: 'DIG 3480',
      title: 'Computer as a Medium',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['Art foundation or permission'],
      description: 'Creative computing, interactive media, and computational art.',
      department: 'Digital Media',
      isUpperLevel: true,
      tags: ['Creative Computing', 'Interactive Media'],
    ),
    
    CatalogCourse(
      id: 'DIG3727C',
      code: 'DIG 3727C',
      title: 'Game Level Design',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['DIG foundation courses'],
      description: 'Design principles and technical implementation of game environments.',
      department: 'Digital Media',
      isUpperLevel: true,
      tags: ['Game Design', 'Level Design'],
    ),
  ];

  // 🔬 PHYSICS COURSES (Alternative Technical Applications)
  static final List<CatalogCourse> physicsCourses = [
    CatalogCourse(
      id: 'PHZ3151',
      code: 'PHZ 3151',
      title: 'Computer Methods in Physics',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['PHY 2049', 'MAC 2312'],
      description: 'Computational techniques for solving physics problems and data analysis.',
      department: 'Physics',
      isUpperLevel: true,
      tags: ['Computational Physics'],
    ),
    
    CatalogCourse(
      id: 'PHZ3150',
      code: 'PHZ 3150',
      title: 'Introduction to Numerical Computing',
      credits: 3,
      fulfills: ['CODE Minor Technical'],
      prerequisites: ['PHY 2049', 'MAC 2312'],
      description: 'Numerical methods and computational approaches in physics.',
      department: 'Physics',
      isUpperLevel: true,
      tags: ['Numerical Computing', 'Physics'],
    ),
  ];

  // 📋 HELPER METHODS
  
  // Get all courses
  static List<CatalogCourse> get allCourses => [
    ...computerScienceCourses,
    ...statisticsCourses,
    ...mathematicsCourses,
    ...biologyCourses,
    ...digitalMediaCourses,
    ...physicsCourses,
  ];

  // Get all technical application courses (non-CS)
  static List<CatalogCourse> get allTechnicalCourses => [
    ...statisticsCourses,
    ...mathematicsCourses,
    ...biologyCourses,
    ...digitalMediaCourses,
    ...physicsCourses,
  ];

  // Your specific AI/ML track
  static List<CatalogCourse> get aiMlTrack => [
    // CS Requirements
    computerScienceCourses.firstWhere((c) => c.code == 'COP 2500C'),
    computerScienceCourses.firstWhere((c) => c.code == 'COP 3223C'),
    computerScienceCourses.firstWhere((c) => c.code == 'COP 3330'),
    
    // Math/Stats Requirements (AI/ML focused)
    statisticsCourses.firstWhere((c) => c.code == 'STA 4364'),
    statisticsCourses.firstWhere((c) => c.code == 'STA 4241'),
    mathematicsCourses.firstWhere((c) => c.code == 'MAP 4112'),
  ];

  // Filter courses by fulfillment requirement
  static List<CatalogCourse> getCoursesByRequirement(String requirement) {
    return allCourses.where((course) => 
      course.fulfills.any((req) => req.contains(requirement))).toList();
  }

  // Filter courses by department
  static List<CatalogCourse> getCoursesByDepartment(String department) {
    return allCourses.where((course) => 
      course.department.toLowerCase() == department.toLowerCase()).toList();
  }

  // Filter courses by upper level
  static List<CatalogCourse> getUpperLevelCourses() {
    return allCourses.where((course) => course.isUpperLevel).toList();
  }

  // Get substitution options for a course
  static List<CatalogCourse> getSubstitutionOptions(String courseCode) {
    final targetCourse = allCourses.firstWhere(
      (c) => c.code == courseCode,
      orElse: () => throw Exception('Course not found: $courseCode'),
    );

    return allCourses.where((course) => 
      course.code != courseCode &&
      course.fulfills.any((req) => targetCourse.fulfills.contains(req))
    ).toList();
  }

  // Check if prerequisites are met
  static bool arePrerequisitesMet(String courseCode, List<String> completedCourses) {
    final course = allCourses.firstWhere(
      (c) => c.code == courseCode,
      orElse: () => throw Exception('Course not found: $courseCode'),
    );

    return course.prerequisites.every((prereq) => 
      completedCourses.any((completed) => completed.contains(prereq.split(' ')[0])));
  }

  // Validate minor progress
  static Map<String, dynamic> validateProgress(List<String> completedCourses) {
    final csCourses = completedCourses.where((course) => 
      computerScienceCourses.any((cs) => cs.code == course)).length;
    
    final techCourses = completedCourses.where((course) => 
      allTechnicalCourses.any((tech) => tech.code == course)).length;
    
    return {
      'cs_courses_completed': csCourses,
      'cs_courses_needed': 3 - csCourses,
      'technical_courses_completed': techCourses,
      'technical_courses_needed': 3 - techCourses,
      'total_completed': csCourses + techCourses,
      'total_needed': 6,
      'is_complete': csCourses >= 3 && techCourses >= 3,
      'progress_percentage': ((csCourses + techCourses) / 6 * 100).round(),
    };
  }
}