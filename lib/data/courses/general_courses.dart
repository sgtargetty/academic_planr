// 📚 General Courses & Electives - Using CatalogCourse Format
// Additional courses for electives, general education, and other requirements

class GeneralCoursesCatalog {
  
  // 🏛️ POLITICAL SCIENCE ELECTIVES (Beyond core requirements)
  static final List<CatalogCourse> politicalScienceElectives = [
    CatalogCourse(
      id: 'PUP3204',
      code: 'PUP 3204',
      title: 'Sustainability',
      credits: 3,
      fulfills: ['Major Elective'],
      prerequisites: ['POS 2041'],
      description: 'Environmental policy, sustainable development, and green governance.',
      department: 'Public Policy',
      isUpperLevel: true,
      tags: ['Environment', 'Policy', 'Sustainability'],
    ),
    
    CatalogCourse(
      id: 'INR4074',
      code: 'INR 4074',
      title: 'Immigration Policy',
      credits: 3,
      fulfills: ['Major Elective'],
      prerequisites: ['POS 2041'],
      description: 'U.S. immigration law, policy, and political debates surrounding immigration.',
      department: 'International Relations',
      isUpperLevel: true,
      tags: ['Immigration', 'Policy', 'Law'],
    ),
    
    CatalogCourse(
      id: 'POS4941',
      code: 'POS 4941',
      title: 'Political Science Internship',
      credits: 3,
      fulfills: ['Major Elective', 'Experiential Learning'],
      prerequisites: ['Junior standing', 'Department approval'],
      description: 'Practical experience in government, campaigns, or political organizations.',
      department: 'Political Science',
      isUpperLevel: true,
      tags: ['Internship', 'Experience', 'Government'],
    ),
    
    CatalogCourse(
      id: 'AMH3421',
      code: 'AMH 3421',
      title: 'American Legal History',
      credits: 3,
      fulfills: ['Major Elective'],
      prerequisites: ['6 hours of history'],
      description: 'Development of American legal system and constitutional law through history.',
      department: 'History',
      isUpperLevel: true,
      tags: ['Legal History', 'Constitution', 'American History'],
    ),
  ];

  // 🎓 HONORS COURSES
  static final List<CatalogCourse> honorsCourses = [
    CatalogCourse(
      id: 'HONR_SPRING2026',
      code: 'HONR',
      title: 'Honors Requirement #1',
      credits: 3,
      fulfills: ['Honors Program'],
      prerequisites: ['Honors Program admission'],
      description: 'Specialized honors coursework - Spring 2026',
      department: 'Honors',
      isUpperLevel: true,
      tags: ['Honors', 'Research'],
    ),
    
    CatalogCourse(
      id: 'HONR_SUMMER2026',
      code: 'HONR',
      title: 'Honors Requirement #2',
      credits: 3,
      fulfills: ['Honors Program'],
      prerequisites: ['Honors Program admission'],
      description: 'Specialized honors coursework - Summer 2026',
      department: 'Honors',
      isUpperLevel: true,
      tags: ['Honors', 'Research'],
    ),
    
    CatalogCourse(
      id: 'HONR_FALL2026',
      code: 'HONR',
      title: 'Honors Requirement #3',
      credits: 3,
      fulfills: ['Honors Program'],
      prerequisites: ['Honors Program admission'],
      description: 'Specialized honors coursework - Fall 2026',
      department: 'Honors',
      isUpperLevel: true,
      tags: ['Honors', 'Research'],
    ),
  ];

  // 📖 GENERAL EDUCATION OPTIONS (Common GE courses students might take)
  static final List<CatalogCourse> generalEducation = [
    CatalogCourse(
      id: 'ENC1101',
      code: 'ENC 1101',
      title: 'Composition I',
      credits: 3,
      fulfills: ['GEP Writing'],
      description: 'Academic writing and critical thinking skills.',
      department: 'English',
      isUpperLevel: false,
      tags: ['Writing', 'Composition'],
    ),
    
    CatalogCourse(
      id: 'ENC1102',
      code: 'ENC 1102',
      title: 'Composition II',
      credits: 3,
      fulfills: ['GEP Writing'],
      prerequisites: ['ENC 1101'],
      description: 'Research-based writing and argumentation.',
      department: 'English',
      isUpperLevel: false,
      tags: ['Writing', 'Research'],
    ),
    
    CatalogCourse(
      id: 'STA2023',
      code: 'STA 2023',
      title: 'Statistical Methods I',
      credits: 3,
      fulfills: ['GEP Math'],
      prerequisites: ['College Algebra'],
      description: 'Introduction to statistical concepts and methods.',
      department: 'Statistics',
      isUpperLevel: false,
      tags: ['Statistics', 'Math'],
    ),
    
    CatalogCourse(
      id: 'MAC1105',
      code: 'MAC 1105',
      title: 'College Algebra',
      credits: 3,
      fulfills: ['GEP Math'],
      description: 'Algebraic functions, equations, and applications.',
      department: 'Mathematics',
      isUpperLevel: false,
      tags: ['Algebra', 'Math'],
    ),
  ];

  // 🌍 FOREIGN LANGUAGE OPTIONS
  static final List<CatalogCourse> foreignLanguages = [
    CatalogCourse(
      id: 'SPN1120',
      code: 'SPN 1120',
      title: 'Beginning Spanish I',
      credits: 4,
      fulfills: ['Foreign Language'],
      description: 'Introduction to Spanish language and culture.',
      department: 'Modern Languages',
      isUpperLevel: false,
      tags: ['Spanish', 'Language'],
    ),
    
    CatalogCourse(
      id: 'SPN1121',
      code: 'SPN 1121',
      title: 'Beginning Spanish II',
      credits: 4,
      fulfills: ['Foreign Language'],
      prerequisites: ['SPN 1120'],
      description: 'Continuation of beginning Spanish.',
      department: 'Modern Languages',
      isUpperLevel: false,
      tags: ['Spanish', 'Language'],
    ),
  ];

  // 🔬 SCIENCE ELECTIVES (For STEM requirements in certificates)
  static final List<CatalogCourse> scienceElectives = [
    CatalogCourse(
      id: 'CHM1025',
      code: 'CHM 1025',
      title: 'Chemistry and Society',
      credits: 3,
      fulfills: ['GEP Science'],
      description: 'Chemistry concepts applied to everyday life and social issues.',
      department: 'Chemistry',
      isUpperLevel: false,
      tags: ['Chemistry', 'Science'],
    ),
    
    CatalogCourse(
      id: 'PSY2012',
      code: 'PSY 2012',
      title: 'General Psychology',
      credits: 3,
      fulfills: ['GEP Social Science'],
      description: 'Introduction to psychological principles and human behavior.',
      department: 'Psychology',
      isUpperLevel: false,
      tags: ['Psychology', 'Behavior'],
    ),
  ];

  // 📋 HELPER METHODS
  
  // Get all general courses
  static List<CatalogCourse> get allCourses => [
    ...politicalScienceElectives,
    ...honorsCourses,
    ...generalEducation,
    ...foreignLanguages,
    ...scienceElectives,
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

  // Get electives only
  static List<CatalogCourse> get electives => politicalScienceElectives;

  // Get honors courses only
  static List<CatalogCourse> get honors => honorsCourses;

  // Get general education courses
  static List<CatalogCourse> get generalEd => generalEducation;

  // Get upper level courses
  static List<CatalogCourse> get upperLevelCourses => 
    allCourses.where((course) => course.isUpperLevel).toList();

  // Check if course is honors
  static bool isHonorsCourse(String courseCode) {
    return honorsCourses.any((course) => course.code == courseCode) || 
           courseCode.startsWith('HONR');
  }

  // Check if course is experiential learning
  static bool isExperientialCourse(String courseCode) {
    return allCourses.any((course) => 
      course.code == courseCode && 
      course.fulfills.contains('Experiential Learning'));
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

  // Your specific planned general courses
  static List<CatalogCourse> get yourPlannedCourses => [
    politicalScienceElectives.firstWhere((c) => c.code == 'PUP 3204'),     // Sustainability
    politicalScienceElectives.firstWhere((c) => c.code == 'INR 4074'),     // Immigration Policy
    politicalScienceElectives.firstWhere((c) => c.code == 'POS 4941'),     // Internship
    politicalScienceElectives.firstWhere((c) => c.code == 'AMH 3421'),     // American Legal History
    honorsCourses.firstWhere((c) => c.id == 'HONR_SPRING2026'),           // Honors #1
    honorsCourses.firstWhere((c) => c.id == 'HONR_SUMMER2026'),           // Honors #2
    honorsCourses.firstWhere((c) => c.id == 'HONR_FALL2026'),             // Honors #3
  ];

  // Check if course is in your planned track
  static bool isInYourPlan(String courseCode) {
    return yourPlannedCourses.any((course) => course.code == courseCode);
  }

  // Filter courses by tags
  static List<CatalogCourse> getCoursesByTag(String tag) {
    return allCourses.where((course) => 
      course.tags?.contains(tag) ?? false).toList();
  }
}