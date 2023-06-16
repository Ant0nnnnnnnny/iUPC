import '../../entities/class_entity.dart';

class ScheduleState {
  late List<ClassEntity> allClasses;
  ScheduleState() {
    allClasses = [];

    ///TODO :TEST
    allClasses = List.filled(10,   ClassEntity(
        name: '测试课程1fsdfsdf',
        beginTime: '12:30',
        endTime: '12:30',
        location: '火星',
        info: '《软件工程》是信息与计算科学专业的专业限选课程。通过本课程的学习，学生能够使用软件工程的方法进行软件项目的分析、设计、实现和测试，旨在培养学生具备软件工程思想及实际软件开发的能力。本课程主要内容包括软件工程与软件过程、软件需求分析与建模、软件设计与建模、软件编程与软件测试。',
        id: '00001',
        teacherName: '秦浩天'),);
  }
}
