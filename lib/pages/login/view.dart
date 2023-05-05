import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      extendBody: true,
      backgroundColor: state.colorScheme.secondaryContainer,
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            const Spacer(),
            Flexible(
              flex: 1,
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Image.asset(
                      'assets/p1.png',
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/p2.png',
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/p3.png',
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/p4.png',
                    ),
                  ),
                ],
              ),
            ),
            _generateInput(state: state, logic: logic)
          ],
        ),
      ),
    );
  }

  Widget _generateInput({required state, logic}) {
    List<Widget> btnIconList = [
      const Icon(Icons.login),
      const CircularProgressIndicator(),
      const Icon(Icons.done),
      const Icon(Icons.close)
    ];
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 32),
        child: Card(
          color: state.colorScheme.background,
          // decoration: BoxDecoration(
          //     color: state.colorScheme.background,
          //     borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Form(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                        key: state.accountKey,
                        decoration: const InputDecoration(
                          hintText: '请输入学号',
                          labelText: '学号',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入学号';
                          } else if (value.length != 10) {
                            return '请输入正确的学号';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.all(16),
                      child: TextFormField(
                        key: state.passwordKey,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                            hintText: '请输入密码', labelText: '密码'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return '请输入密码';
                          } else if (value.length != 10) {
                            return '请正确输入密码';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.all(16),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(flex: 2,
                              child: TextButton(
                                  onPressed: () => {}, child: const Text('忘记密码'))),
                          const Spacer(),
                          Flexible(flex: 2,
                              child: TextButton(
                                  onPressed: () => {}, child: const Text('我是新生')))
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (state.accountKey.currentState!.validate() &&
                              state.passwordKey.currentState()!.validate()) {
                            // Process data.
                          }
                        },
                        child: Flex(
                          mainAxisSize: MainAxisSize.min,
                          direction: Axis.horizontal,
                          children: [const Spacer(),
                            Flexible(flex: 3,
                                child: btnIconList[state.verifyState.value]),
                            const Spacer(),
                            const Flexible(flex: 3,child: Text('登录')),Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
