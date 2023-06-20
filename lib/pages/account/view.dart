import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AccountLogic());
    final state = Get.find<AccountLogic>().state;

    return Expanded(
        child: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          flex: 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 48,
                  child: Icon(
                    Icons.person,
                    size: 48,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                          child: Card(
                            child: InkWell(
                              borderRadius: const BorderRadius.all(Radius.circular(14)),
                              onTap: (){},
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      const Text('宿舍电费'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '12.1',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium,
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.all(4.0),
                                                        child: Text('度'),
                                                      )
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Flexible(
                          child: Card(
                        child: InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(14)),
                          onTap: (){},
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  const Text('空调电费'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '6.3',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text('度'),
                                              )
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 0, 16, 0),
                              child: Icon(Icons.account_circle_outlined),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '学号',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '2009050223',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 0, 16, 0),
                              child: Icon(Icons.house_rounded),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '宿舍号',
                                  style:
                                  Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '18-834',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 0, 16, 0),
                              child: Icon(Icons.timeline_outlined),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '学习总时长',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '3 小时 15分钟',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
