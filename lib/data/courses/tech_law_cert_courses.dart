// ⚖️ Technology and the Law Certificate - Using CatalogCourse Format
// 15 credits: 2 Required + Law-Centered Track (2 Law + 1 STEM) or Technology Track (2 STEM + 1 Law)

class TechLawCertificateCatalog {
  
  // 📚 REQUIRED COURSES (6 credits - Must take both)
  static final List<CatalogCourse> requiredCourses = [
    CatalogCourse(
      id: 'HIS3462',
      code: 'HIS 3462',
      title: 'History of Science',
      credits: 3,
      fulfills: ['Tech Law Certificate Required'],
      prerequisites: ['6 hours of history or permission'],
      description: 'Development of scientific thought and its impact on society from ancient times to present.',
      department: 'History',
      isUpperLevel: true,
    ),
    
    CatalogCourse(
      id: 'PLA3871',
      code: 'PLA 3871',
      title: 'Law and Technology',
      credits: 3,
      fulfills: ['Tech Law Certificate Required'],
      prerequisites: ['Junior standing'],
      description: 'Legal issues arising from technological advancement, including privacy, intellectual property, and regulation.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Technology', 'Law', 'Privacy'],
    ),
  ];

  // ⚖️ LAW COURSES (For both tracks - Choose 1 or 2 depending on track)
  static final List<CatalogCourse> lawCourses = [
    CatalogCourse(
      id: 'PLA3277',
      code: 'PLA 3277',
      title: 'The Law of Torts',
      credits: 3,
      fulfills: ['Tech Law Certificate Law'],
      prerequisites: ['Junior standing'],
      description: 'Principles of tort law including negligence, intentional torts, and strict liability.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Tort Law', 'Liability'],
    ),
    
    CatalogCourse(
      id: 'PLA4410',
      code: 'PLA 4410',
      title: 'Intellectual Property Law and Practice',
      credits: 3,
      fulfills: ['Tech Law Certificate Law', 'Major Core'], // OVERLAP COURSE!
      prerequisites: ['PLA 3108 or permission'],
      description: 'Patents, copyrights, trademarks, and trade secrets in the digital age.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Intellectual Property', 'Technology', 'Patents', 'Copyright'],
    ),
    
    CatalogCourse(
      id: 'PLA4485',
      code: 'PLA 4485',
      title: 'Administrative Law',
      credits: 3,
      fulfills: ['Tech Law Certificate Law'],
      prerequisites: ['PLA 3108 or permission'],
      description: 'Powers and procedures of administrative agencies and judicial review of agency actions.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Administrative Law', 'Government'],
    ),
    
    CatalogCourse(
      id: 'PLA4585',
      code: 'PLA 4585',
      title: 'Cybersecurity and the Law',
      credits: 3,
      fulfills: ['Tech Law Certificate Law'],
      prerequisites: ['PLA 3108 or permission'],
      description: 'Legal frameworks governing cybersecurity, data protection, and digital privacy.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Cybersecurity', 'Privacy', 'Technology', 'Data Protection'],
    ),
    
    CatalogCourse(
      id: 'PLA4861',
      code: 'PLA 4861',
      title: 'Aviation Law',
      credits: 3,
      fulfills: ['Tech Law Certificate Law'],
      prerequisites: ['PLA 3108 or permission'],
      description: 'Federal regulation of aviation, international aviation law, and aerospace technology.',
      department: 'Legal Studies',
      isUpperLevel: true,
      tags: ['Aviation', 'Transportation', 'Aerospace'],
    ),
  ];

  // 🔬 STEM/TECHNOLOGY COURSES (For both tracks - Choose 1 or 2 depending on track)
  static final List<CatalogCourse> stemCourses = [
    CatalogCourse(
      id: 'PHI3626',
      code: 'PHI 3626',
      title: 'Advanced Ethics in Science and Technology',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['PHI 2010 or permission'],
      description: 'Ethical issues in scientific research, technology development, and engineering practice.',
      department: 'Philosophy',
      isUpperLevel: true,
      tags: ['Ethics', 'Technology', 'Science', 'Engineering'],
    ),
    
    CatalogCourse(
      id: 'PHI4400',
      code: 'PHI 4400',
      title: 'Philosophy of Science',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['PHI 2010 or permission'],
      description: 'Nature of scientific knowledge, theory formation, and the logic of scientific discovery.',
      department: 'Philosophy',
      isUpperLevel: true,
      tags: ['Philosophy', 'Science', 'Logic', 'Knowledge'],
    ),
    
    CatalogCourse(
      id: 'PHI4633',
      code: 'PHI 4633',
      title: 'Ethics and Biological Science',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['PHI 2010 or permission'],
      description: 'Ethical issues in biotechnology, genetic engineering, and medical research.',
      department: 'Philosophy',
      isUpperLevel: true,
      tags: ['Bioethics', 'Genetics', 'Medicine', 'Biotechnology'],
    ),
    
    CatalogCourse(
      id: 'ANT4081',
      code: 'ANT 4081',
      title: 'Science, Technology, and Culture',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['ANT 2000 or permission'],
      description: 'Anthropological perspective on science and technology in cultural context.',
      department: 'Anthropology',
      isUpperLevel: true,
      tags: ['Culture', 'Technology', 'Society', 'Anthropology'],
    ),
    
    CatalogCourse(
      id: 'LIT4433',
      code: 'LIT 4433',
      title: 'Literature of Science and Technology',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['ENC 1102', 'Literature foundation'],
      description: 'Literary representations of science and technology from the Enlightenment to present.',
      department: 'Literature',
      isUpperLevel: true,
      tags: ['Literature', 'Science Fiction', 'Technology', 'History'],
    ),
    
    CatalogCourse(
      id: 'PUP4503',
      code: 'PUP 4503',
      title: 'Government and Science',
      credits: 3,
      fulfills: ['Tech Law Certificate STEM'],
      prerequisites: ['POS 2041 or permission'],
      description: 'Role of government in science policy, funding, and regulation of scientific research.',
      department: 'Public Policy',
      isUpperLevel: true,
      tags: ['Science Policy', 'Government', 'Research', 'Policy'],
    ),
  ];

  // 📋 TRACK DEFINITIONS AND HELPER METHODS
  
  // Get all certificate courses
  static List<CatalogCourse> get allCourses => [
    ...requiredCourses,
    ...lawCourses,
    ...stemCourses,
  ];

  // Law-Centered Track courses (your track)
  static Map<String, List<CatalogCourse>> get lawCenteredTrack => {
    'required': requiredCourses,        // Take both (2 courses)
    'law': lawCourses,                  // Choose 2 
    'stem': stemCourses,                // Choose 1
  };

  // Technology Track courses  
  static Map<String, List<CatalogCourse>> get technologyTrack => {
    'required': requiredCourses,        // Take both (2 courses)
    'stem': stemCourses,                // Choose 2
    'law': lawCourses,                  // Choose 1
  };

  // Your specific planned courses (Law-Centered Track)
  static List<CatalogCourse> get yourPlannedTrack => [
    // Required (2 courses)
    requiredCourses.firstWhere((c) => c.code == 'HIS 3462'),
    requiredCourses.firstWhere((c) => c.code == 'PLA 3871'),
    
    // Law courses (2 courses)
    lawCourses.firstWhere((c) => c.code == 'PLA 4410'), // Already completed - OVERLAP!
    lawCourses.firstWhere((c) => c.code == 'PLA 4585'),
    
    // STEM course (1 course)
    stemCourses.firstWhere((c) => c.code == 'PHI 3626'),
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

  // Get substitution options for a course
  static List<CatalogCourse> getSubstitutionOptions(String courseCode, String trackType) {
    final targetCourse = allCourses.firstWhere(
      (c) => c.code == courseCode,
      orElse: () => throw Exception('Course not found: $courseCode'),
    );

    // Required courses cannot be substituted
    if (requiredCourses.contains(targetCourse)) {
      return [];
    }

    // Law courses can substitute with other law courses
    if (lawCourses.contains(targetCourse)) {
      return lawCourses.where((c) => c.code != courseCode).toList();
    }

    // STEM courses can substitute with other STEM courses
    if (stemCourses.contains(targetCourse)) {
      return stemCourses.where((c) => c.code != courseCode).toList();
    }

    return [];
  }

  // Check if course is overlap course (satisfies multiple requirements)
  static bool isOverlapCourse(String courseCode) {
    final course = allCourses.firstWhere(
      (c) => c.code == courseCode,
      orElse: () => throw Exception('Course not found: $courseCode'),
    );
    
    return course.fulfills.length > 1;
  }

  // Check if course is in your planned track
  static bool isInYourTrack(String courseCode) {
    return yourPlannedTrack.any((course) => course.code == courseCode);
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

  // Validate certificate progress
  static Map<String, dynamic> validateProgress(List<String> completedCourses, String trackType) {
    final requiredCompleted = completedCourses.where((course) => 
      requiredCourses.any((req) => req.code == course)).length;
    
    final lawCompleted = completedCourses.where((course) => 
      lawCourses.any((law) => law.code == course)).length;
    
    final stemCompleted = completedCourses.where((course) => 
      stemCourses.any((stem) => stem.code == course)).length;

    bool isComplete = false;
    Map<String, int> needed = {};

    if (trackType.toLowerCase() == 'law-centered') {
      needed = {
        'required': 2 - requiredCompleted,
        'law': 2 - lawCompleted,
        'stem': 1 - stemCompleted,
      };
      isComplete = requiredCompleted >= 2 && lawCompleted >= 2 && stemCompleted >= 1;
    } else {
      needed = {
        'required': 2 - requiredCompleted,
        'stem': 2 - stemCompleted,
        'law': 1 - lawCompleted,
      };
      isComplete = requiredCompleted >= 2 && stemCompleted >= 2 && lawCompleted >= 1;
    }

    final totalCompleted = requiredCompleted + lawCompleted + stemCompleted;

    return {
      'track_type': trackType,
      'required_completed': requiredCompleted,
      'law_completed': lawCompleted,
      'stem_completed': stemCompleted,
      'total_completed': totalCompleted,
      'total_needed': 5,
      'needed': needed,
      'is_complete': isComplete,
      'progress_percentage': (totalCompleted / 5 * 100).round(),
    };
  }

  // Get track information
  static Map<String, String> getTrackInfo(String trackType) {
    if (trackType.toLowerCase() == 'law-centered') {
      return {
        'name': 'Law-Centered Track',
        'description': '2 Required + 2 Law + 1 STEM',
        'focus': 'Legal studies with technology perspective',
      };
    } else {
      return {
        'name': 'Technology Track', 
        'description': '2 Required + 2 STEM + 1 Law',
        'focus': 'Technology/science with legal perspective',
      };
    }
  }

  // Filter courses by tags
  static List<CatalogCourse> getCoursesByTag(String tag) {
    return allCourses.where((course) => 
      course.tags?.contains(tag) ?? false).toList();
  }

  // Get all overlap courses (courses that satisfy multiple requirements)
  static List<CatalogCourse> get overlapCourses {
    return allCourses.where((course) => course.fulfills.length > 1).toList();
  }
}