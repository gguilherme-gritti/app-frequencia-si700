class DisciplineDataModel {
  String course_id;
  String code;
  String week_day;
  String initial_hour;
  String final_hour;
  String description;

  DisciplineDataModel({
    required this.course_id,
    required this.code,
    required this.description,
    required this.week_day,
    required this.initial_hour,
    required this.final_hour,
  });
}
