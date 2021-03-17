class AppUrls {
  static const String BASE_URL = 'https://tech-learn-mafraq.herokuapp.com';

  static String loginUrl() {
    return BASE_URL + '/login';
  }

  static String getAllCoursesByTeacherId(int Id) {
    return BASE_URL + '/getteachercourses/$Id';
  }

  static String getCourseByCourseId(int Id) {
    return BASE_URL + '/getcoursebyid/$Id';
  }

  static String addStudentToCourse() {
    return BASE_URL + '/addstudenttocourse';
  }

  static String registerUrl() {
    return BASE_URL + '/register';
  }

  static String editUser() {
    return BASE_URL + '/edituser';
  }

  static String editCourseUrl() {
    return BASE_URL + '/editcourse';
  }

  static String getAllCoursesUrl() {
    return BASE_URL + '/getallcourses';
  }

  static String getCustomCourses() {
    return BASE_URL + '/getcustomcourses';
  }

  static String getTeacherById(int Id) {
    return BASE_URL + '/getteacherbyid/$Id';
  }

  static String getCourseByGradeSubject(int grade, int subject) {
    return BASE_URL + '/getcoursebygradesubject/$grade/$subject';
  }

  static String getSubjectsByGradeId(int gradeId) {
    return BASE_URL + '/getsubjectsbygradeid/$gradeId';
  }

  static String addCourse() {
    return BASE_URL + '/addcourse';
  }
}
