import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/entities/notification_entity.dart';

import 'logic.dart';

class NotificationBox extends StatefulWidget {
  final double width;
  const NotificationBox({Key? key, required this.width}) : super(key: key);

  @override
  State<NotificationBox> createState() => _NotificationBoxState();
}

class _NotificationBoxState extends State<NotificationBox> {
  final logic = Get.put(NotificationBoxLogic());
  final state = Get.find<NotificationBoxLogic>().state;
  GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> pinnedKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state.informationList = state.informationList;
    double height = 128 +
        state.informationList.length * 56 +
        state.pinnedInformationList.length * 56;
    debugPrint(height.toString());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('通知中心', style: Theme.of(context).textTheme.titleMedium),
        ),
        AnimatedContainer(
          curve: Curves.easeOutCirc,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 2),
          width: widget.width,
          height: height,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          duration: const Duration(milliseconds: 400),
          child: Column(
            children: [
              _generatePinnedList(context),
              const Divider(),
              _generateNotificationItem(context),
              _endBar(context)
            ],
          ),
        ),
      ],
    );
  }

  Widget _generatePinnedList(context) {
    if (state.pinnedInformationList.isEmpty) {
      return Center(
          child: Text(
        '暂无待办',
        style: Theme.of(context).textTheme.labelLarge,
      ));
    } else {
      return Center(
        child: AnimatedList(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: pinnedKey,
            initialItemCount: state.pinnedInformationList.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return upSlideTransition(
                  animation, state.pinnedInformationList, index, context);
            }),
      );
    }
  }

  Widget _generateNotificationItem(context) {
    if (state.informationList.isEmpty) {
      return Center(
          child: Text(
        '暂无通知',
        style: Theme.of(context).textTheme.labelLarge,
      ));
    } else {
      return AnimatedList(
          physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          key: key,
          initialItemCount: state.informationList.length,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return slideTransition(
                animation, state.informationList, index, context);
          });
    }
  }

  SlideTransition upSlideTransition(Animation<double> animation,
      List<NotificationEntity> it, int index, BuildContext context) {
    return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCirc,
                    reverseCurve: Curves.easeInCirc)),
        child: pinnedItem(it, index, context));
  }

  SlideTransition slideTransition(Animation<double> animation,
      List<NotificationEntity> it, int index, BuildContext context) {
    return SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInCirc,
                    reverseCurve: Curves.easeOutCirc)),
        child: inkWell(it, index, context));
  }

  InkWell inkWell(
      List<NotificationEntity> it, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        it[index].onClick();
      },
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 8.0),
            child: Row(
              children: [
                it[index].icon ?? const Icon(Icons.notifications),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(it[index].title,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        it[index].context,
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
                const Expanded(child: Text('')),
                IconButton(
                  icon: const Icon(Icons.notification_add_outlined),
                  onPressed: () {
                    setState(() {
                      state.pinnedInformationList
                          .add(state.informationList[index]);
                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() {
                          state.informationList.removeAt(index);
                        });
                      });
                      key.currentState?.removeItem(
                          index,
                          (context, animation) =>
                              slideTransition(animation, it, index, context),
                          duration: const Duration(milliseconds: 400));
                      pinnedKey.currentState?.insertItem(0);
                      debugPrint(state.informationList.length.toString());
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () {
                    setState(() {
                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() {
                          state.informationList.removeAt(index);
                        });
                      });
                      key.currentState?.removeItem(
                          index,
                          (context, animation) =>
                              slideTransition(animation, it, index, context),
                          duration: const Duration(milliseconds: 400));

                      debugPrint(state.informationList.length.toString());
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell pinnedItem(
      List<NotificationEntity> it, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        it[index].onClick();
      },
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 8.0),
            child: Row(
              children: [
                it[index].icon ??
                    const Icon(Icons.notifications_active_outlined),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(it[index].title,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        it[index].context,
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
                const Expanded(child: Text('')),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        setState(() {
                          state.pinnedInformationList.removeAt(index);
                        });
                      });
                      pinnedKey.currentState?.removeItem(
                          index,
                          (context, animation) =>
                              upSlideTransition(animation, it, index, context),
                          duration: const Duration(milliseconds: 300));

                      debugPrint(state.pinnedInformationList.toString());
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _endBar(context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                state.informationList.insert(
                    0, NotificationEntity(title: '231', context: 'context'));
                debugPrint(state.informationList.length.toString());
                key.currentState?.insertItem(0);
              });
            },
            icon: const Icon(Icons.more_horiz)),
        const Expanded(child: Text('')),
        AnimatedSwitcher(
          switchInCurve: Curves.easeOutCirc,
          switchOutCurve: Curves.easeInCirc,
          transitionBuilder: (child, anim) {
            return ScaleTransition(
              scale: anim,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 200),
          child: state.informationList.isEmpty
              ? Container(
                  key: const ValueKey(0),
                )
              : Badge(
                  isLabelVisible: state.informationList.isNotEmpty,
                  label: Text(
                    state.informationList.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.apply(color: Theme.of(context).colorScheme.onError),
                  ),
                  child: IconButton(
                      key: const ValueKey(1),
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {
                            state.informationList.clear();
                          });
                        });

                        key.currentState?.removeAllItems(
                            (context, animation) => slideTransition(
                                animation, state.informationList, 0, context),
                            duration: const Duration(milliseconds: 400));
                      },
                      icon: const Icon(Icons.done_all)),
                ),
        )
      ],
    );
  }
}
