import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/entities/class_entity.dart';

import 'logic.dart';

class ClassInformationPage extends StatelessWidget {
  const ClassInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ClassInformationLogic());
    final state = Get.find<ClassInformationLogic>().state;
    final ClassEntity classInfo = Get.arguments[0];
    final String uniqueTag = Get.arguments[1];
    debugPrint(MediaQuery.of(context).size.width.toString());
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            title: Hero(
              tag: '$uniqueTag${classInfo.id!}name',
              child: Text(
                classInfo.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.info_outline),
                  text: '简介',
                ),
                Tab(icon: Icon(Icons.cloud_circle), text: '课程资源'),
                Tab(
                  icon: Icon(Icons.list),
                  text: '作业',
                ),
                Tab(icon: Icon(Icons.edit), text: '考试'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: uniqueTag + classInfo.id!,
                        child: classInfo.imgUrl != null
                            ? Image.network(classInfo.imgUrl!)
                            : Image.asset('assets/class_default.png'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ExpandableText(
                            classInfo.info!,
                            animation: true,
                            maxLines: 5, expandText: '展开',
                            collapseText: '收起',
                            animationDuration: const Duration(milliseconds: 400),
                            animationCurve: Curves.easeOut,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: Icon(
                                Icons.person,
                                size: 24,
                              ),
                            ),
                            Text(
                              '教师信息',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    '教师姓名',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    classInfo.teacherName??'暂无信息',
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    '电子邮箱',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    'qhtLucifer@foxmail.com',
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: Icon(
                                Icons.class_,
                                size: 24,
                              ),
                            ),
                            Text(
                              '课程信息',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state.classInfo,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Icon(Icons.schedule),
                        ),
                        Text(
                          '课程课表',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 200,
                    height: 260,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24))),
                  ),
                ),
              ]),
              const Center(child: Text('TBD')),
              const Center(child: Text('TBD')),
              const Center(child: Text('TBD'))
            ],
          ),
        ));
  }
}
