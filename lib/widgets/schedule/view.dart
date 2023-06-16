import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/constants.dart';
import 'package:iupc/entities/class_entity.dart';
import 'package:iupc/widgets/schedule/state.dart';
import 'logic.dart';

class SchedulePage extends StatefulWidget {
  final double width;

  const SchedulePage({Key? key, required this.width}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final logic = Get.put(ScheduleLogic());
  final state = Get.find<ScheduleLogic>().state;
  bool isExpanded = false;
  GlobalKey key = GlobalKey();
  late double minHeight;
  late double expandedHeight;
  @override
  Widget build(BuildContext context) {
    minHeight =
        state.allClasses.length >= 3 ? 196 : 58.0 * state.allClasses.length;
    expandedHeight = 58.0 * state.allClasses.length;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '今日课程',
              style: Theme.of(context).textTheme.titleMedium,
            )),
        Container(
          width: widget.width,
          // height: (isExpanded?264+34.0*state.allClasses.length:baseHeight),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(14))),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateTime.now().day.toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Text(
                                '日',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: state.allClasses.isNotEmpty ? 3 : 2,
                      child: state.allClasses.isNotEmpty
                          ? Column(
                              children: [
                                AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOutCirc,
                                    width: widget.width,
                                    height: (isExpanded
                                        ? expandedHeight
                                        : minHeight),
                                    child: _generateSchedule()),
                              ],
                            )
                          : Center(
                              child: Row(
                              children: [
                                const Text('今日暂无课程'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.tag_faces_outlined,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                )
                              ],
                            )),
                    )
                  ],
                ),
              ),
              state.allClasses.length > 3
                  ? Row(
                      children: [
                        const Expanded(child: Text('')),
                        AnimatedSwitcher(
                            transitionBuilder: (child, anim) {
                              return ScaleTransition(
                                scale: anim,
                                child: child,
                              );
                            },
                            duration: const Duration(milliseconds: 400),
                            child: IconButton(
                                key: ValueKey(isExpanded),
                                onPressed: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                icon: Icon(!isExpanded
                                    ? Icons.fullscreen_rounded
                                    : Icons.fullscreen_exit_rounded))),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _generateSchedule() {
    return ListView(
      physics: isExpanded? const NeverScrollableScrollPhysics():null,
      shrinkWrap: isExpanded,
      children: state.allClasses.map((e) => _scheduleTile(e)).toList(),
    );
  }

  Widget _scheduleTile(ClassEntity classEntity) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.class_outlined,size: 16,color: Theme.of(context).colorScheme.tertiary,),
              SizedBox(
                  width: checkIslandScape(context)? 84:64,
                  child: Text(
                    classEntity.name,
                    overflow: TextOverflow.ellipsis,
                  )),
              const Expanded(child: Text('')),
               Icon(Icons.person_outline,size: 16,color: Theme.of(context).colorScheme.tertiary,),
              Text(classEntity.teacherName ?? '暂无教师信息')
            ],
          ),
          Row(
            children: [
               Icon(Icons.schedule,size: 16,color: Theme.of(context).colorScheme.tertiary,),
              Text('${classEntity.beginTime}-${classEntity.endTime}'),
              const Expanded(child: Text('')),
               Icon(Icons.location_city_outlined,size: 16,color: Theme.of(context).colorScheme.tertiary,),
              Text(classEntity.location),
            ],
          ),
        ],
      ),
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
      padding: const EdgeInsets.all(5),
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
      padding: const EdgeInsets.all(5),
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
      padding: const EdgeInsets.all(5),
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
    required this.status,
    required this.logic,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: status == 0
          ? const EdgeInsets.only(left: 8)
          : const EdgeInsets.only(left: 8, top: 4, bottom: 4),
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
            flex: 2,
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
                Icon(
                  Icons.location_city,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
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
