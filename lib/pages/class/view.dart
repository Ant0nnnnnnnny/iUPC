import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/pages/class_information/view.dart';

import '../../constants.dart';
import '../../entities/class_entity.dart';
import 'logic.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final logic = Get.put(ClassLogic());
  final state = Get.find<ClassLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('快捷访问'),
              AnimatedContainer(
                curve: Curves.easeOutCirc,
                height: state.pinnedClasses.isNotEmpty ? 262 : 84,
                duration: const Duration(milliseconds: 400),
                child: state.pinnedClasses.isNotEmpty
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: state.pinnedClasses
                            .map((e) => _pinnedClassCard(context, e))
                            .toList(),
                      )
                    : const Center(
                        child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('暂无已收藏的课程，您可以在课程卡片中选择添加'),
                      )),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('全部课程'),
              SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.allClasses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _classCard(context, state.allClasses[index]);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).size.width/238).round(),
                    mainAxisExtent: 265
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _classCard(context, ClassEntity classObj) {
    return Container(
      width: 204,
      height: 256,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: 'qht${classObj.id!}',
                child: Image.asset(
                  'assets/class_default.png',
                  width: 204,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
              child: Row(
                children: [
                  Text('课程名称：', style: Theme.of(context).textTheme.titleSmall),
                  Hero(
                      tag: 'qht${classObj.id!}name',
                      child: Text(classObj.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
              child: Text(
                '主讲教师：${classObj.teacherName}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Row(
                children: [
                  FilledButton(
                      onPressed: () {
                        Get.to(() => const ClassInformationPage(),
                            arguments: [classObj,'qht']);
                      },
                      child: const Text('进入')),
                  const Expanded(child: Text('')),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            onTap: () {
                              setState(() {
                                classObj.isPinned = !classObj.isPinned;
                                logic.filterPinned();
                              });
                            },
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              children: [
                                Icon(classObj.isPinned
                                    ? Icons.star_rounded
                                    : Icons.star_outline_rounded),
                                Text(classObj.isPinned ? '取消收藏' : '收藏')
                              ],
                            ))
                      ];
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _pinnedClassCard(context, ClassEntity classObj) {
    return Container(
      width: 204,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: 'antony${classObj.id!}',
                child: Image.asset(
                  'assets/class_default.png',
                  width: 204,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
              child: Row(
                children: [
                  Text('课程名称：', style: Theme.of(context).textTheme.titleSmall),
                  Hero(
                      tag: 'antony${classObj.id!}name',
                      child: Text(classObj.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
              child: Text(
                '主讲教师：${classObj.teacherName}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: Row(
                children: [
                  FilledButton(
                      onPressed: () {
                        Get.to(() =>  const ClassInformationPage(),
                            arguments: [classObj,'antony']);
                      },
                      child: const Text('进入'),),
                  const Expanded(child: Text('')),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            onTap: () {
                              setState(() {
                                classObj.isPinned = !classObj.isPinned;
                                logic.filterPinned();
                              });
                            },
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              children: [
                                Icon(classObj.isPinned
                                    ? Icons.star_rounded
                                    : Icons.star_outline_rounded),
                                Text(classObj.isPinned ? '取消收藏' : '收藏')
                              ],
                            ))
                      ];
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
