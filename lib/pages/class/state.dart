import '../../entities/class_entity.dart';

class ClassState {
  late List<ClassEntity> pinnedClasses;
  late List<ClassEntity> allClasses;
  ClassState() {
    pinnedClasses = [];
    allClasses = [];

    ///TODO :TEST
    allClasses = [
      ClassEntity(
          name: '测试课程1',
          beginTime: '12:30',
          endTime: '12:30',
          location: '火星',
          info: '《软件工程》是信息与计算科学专业的专业限选课程。通过本课程的学习，学生能够使用软件工程的方法进行软件项目的分析、设计、实现和测试，旨在培养学生具备软件工程思想及实际软件开发的能力。本课程主要内容包括软件工程与软件过程、软件需求分析与建模、软件设计与建模、软件编程与软件测试。',
          id:'00001',
          teacherName: '秦浩天'),
      ClassEntity(
          name: '测试课程2',
          beginTime: '12:30',
          endTime: '12:30',
          location: '火星',
          info: '123123131312312',
          id:'00002',
          teacherName: '秦浩天'),
      ClassEntity(
          name: '测试课程3',
          beginTime: '12:30',
          endTime: '12:30',
          location: '火星',
          info: '123123131312312',
          id:'00003',
          teacherName: '秦浩天'),
      ClassEntity(
          name: '测试课程4',
          beginTime: '12:30',
          endTime: '12:30',
          location: '火星',
          info: '123123131312312',
          id:'00004',
          teacherName: '秦浩天'),
      ClassEntity(
          name: '测试课程5',
          beginTime: '12:30',
          endTime: '12:30',
          location: '火星',
          info: '123123131312312',
          id:'00005',
          teacherName: '秦浩天')
    ];

    ///Initialize variables
  }
}
