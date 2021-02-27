class AppUrls {
  static const String BASE_URL = 'https://tech-learn-mafraq.herokuapp.com';

  static String loginUrl() {
    return BASE_URL + '/login';
  }
  static String getAllCoursesByTeacherId(int Id) {
    return BASE_URL + '/getteachercourses/$Id';
  }
  static String getAllCoursesByCourseId(int Id) {
    return BASE_URL + '/getcoursebyid/$Id';
  }
  static String addStudentToCourse() {
    return BASE_URL + '/addstudenttocourse';
  }
  static String registerUrl() {
    return BASE_URL + '/register';
  }
  static String editCourseUrl() {
    return BASE_URL + '/editcourse';
  }
}
