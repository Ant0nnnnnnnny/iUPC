import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/widgets/schedule/state.dart';
import 'logic.dart';

class SchedulePage extends StatelessWidget {
  final double height;

  SchedulePage({Key? key, required this.height}) : super(key: key);

  final logic = Get.put(ScheduleLogic());
  final state = Get
      .find<ScheduleLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Container(
                height: height,
                width: height * 0.8,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.zero,
                      //   bottomLeft: Radius.zero,
                        topRight: Radius.circular(height * 0.3),
                        bottomRight: Radius.circular(height * 0.3))),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ClassBeside(
                        classLocation: '南教302',
                        className: '神经网络与深度学习',
                        beginTime: '8:00',
                        endTime: '10:35',
                        status: 1,
                        state: state,
                        logic: logic,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                        flex: 1, child: ClassBeside(
                      classLocation: '东廊201',
                      className: '软件工程',
                      beginTime: '10:55',
                      endTime: '12:20',
                      status: -1,
                      state: state,
                      logic: logic,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: height,
                width: height * 1,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    const Spacer(),
                    Flexible(
                      child: Container(
                        height: height,
                        width: height * 1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.only(
                              // topLeft: Radius.zero,
                              //   bottomLeft: Radius.zero,
                                topRight: Radius.circular(height),
                                bottomRight: Radius.circular(height))),
                        child: ClassBeside(
                          className: '大数据管理',
                          classLocation: '南教201',
                          beginTime: '14:00',
                          endTime: '15:35',
                          status: 0,
                          state: state,
                          logic: logic,),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          );
  }
}

class ClassBeside extends StatelessWidget {
  final String className;
  final String beginTime;
  final String endTime;
  final String classLocation;
  final ScheduleLogic logic;
  final ScheduleState state;
  final List<Widget> statusIconList = [
    Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      child: const Center(
        child: Icon(
          Icons.circle_outlined,
          color: Colors.white,
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(1),
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      child: const Center(
        child: Icon(
          Icons.school_outlined,
          color: Colors.white,
        ),
      ),
    ),
    Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      child: const Center(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    ),
  ];

  // -1还没开课，0在上，1上完了
  final int status;

  ClassBeside({
    super.key,
    required this.className,
    required this.classLocation,
    required this.beginTime,
    required this.endTime,
    required this.status, required this.logic, required this.state,
  });

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: status == 0 ? const EdgeInsets.only(left: 8) : const EdgeInsets
            .only(left: 8, top: 4, bottom: 4),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: Row(
                children: [
                  Icon(Icons.access_time_outlined,
                      color: Theme.of(context).colorScheme.onSecondaryContainer),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "$beginTime-$endTime",
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: status == 0
                    ? const EdgeInsets.only(right: 16)
                    : const EdgeInsets.only(left: 8, right: 32),
                child: Row(
                  children: [

                    Expanded(
                      child: Center(
                        child: Text(
                          className,
                          style: (const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis)),
                        ),
                      ),
                    ),
                    statusIconList[status + 1]
                  ],
                ),
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  Icon(Icons.location_city,
                    color:Theme.of(context).colorScheme.onSecondaryContainer,),
                  Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        classLocation,
                      )),
                ],
              ),
            )
          ],
        ),
      );
  }
}
