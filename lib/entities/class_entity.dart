class ClassEntity{
  final String name;
  final String beginTime;
  final String endTime;
  final String location;
  late String? imgUrl;
  late String? teacherName;
  late String? info;
  late String? id = '0000';
  bool isPinned = false;
  ClassEntity({required this.name, required this.beginTime, required this.endTime, required this.location, this.imgUrl, this.info,this.teacherName,this.id}){
    id ??= '0000';
  }

  void initializeClassInfo({String? info, String? teacherName,String? imgUrl}){
    this.teacherName = teacherName;
    this.info = info;
    this.imgUrl = imgUrl;
  }
}