class DisciplineDataModel {
  String course_code;
  String code;
  String week_day;
  String initial_hour;
  String final_hour;
  String description;
  String user_email;

  DisciplineDataModel({
    required this.course_code,
    required this.code,
    required this.description,
    required this.week_day,
    required this.initial_hour,
    required this.final_hour,
    required this.user_email,
  });
}
