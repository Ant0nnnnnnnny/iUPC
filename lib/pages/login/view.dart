import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iupc/pages/login/state.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    final state = Get.find<LoginLogic>().state;

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
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
            _generateInput(state: state, logic: logic,context: context)
          ],
        ),
      ),
    );
  }

  Widget _generateInput({required state, logic,context}) {
    List<Widget> btnIconList = [
      const Icon(Icons.login),
      CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      const Icon(Icons.done),
      const Icon(Icons.close)
    ];
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Card(
          color: Theme.of(context).colorScheme.background,
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Form(
              key: state.formKey,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: state.accountController,
                          maxLength: 10,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            suffixIcon: IconButton(
                                onPressed: logic.cleanAccountText,
                                icon: const Icon(Icons.close)),
                            hintText: '请输入学号',
                            labelText: '学号',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '请输入学号';
                            } else if (value.length != 10 ||
                                !GetUtils.isNum(value)) {
                              return '请输入正确的学号';
                            } else {
                              return null;
                            }
                          },
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Obx(() {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: state.passwordController,
                          obscureText: !state.visibility.value,
                          autocorrect: false,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: AnimatedSwitcher(
                                transitionBuilder: (child, anim) {
                                  return ScaleTransition(
                                    scale: anim,
                                    child: child,
                                  );
                                },
                                duration: const Duration(milliseconds: 150),
                                child: IconButton(
                                    key: ValueKey(state.visibility.value),
                                    onPressed: () {
                                      logic.changeVisibility();
                                    },
                                    icon: state.visibility.value
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                              ),
                              hintText: '请输入密码',
                              labelText: '密码'),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '请输入密码';
                            } else {
                              return null;
                            }
                          },
                        );
                      }),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 2,
                              child: TextButton(
                                  onPressed: () => {},
                                  child: const Text('忘记密码'))),
                          const Spacer(),
                          Flexible(
                              flex: 2,
                              child: TextButton(
                                  onPressed: () => {},
                                  child: const Text('我是新生')))
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        child: Obx(() {
                          return Checkbox(
                              value: state.isChecked.value,
                              onChanged: (value) {
                                state.isChecked.value = value!;
                              });
                        }),
                      ),
                      const Flexible(child: Text('自动登录'))
                    ],
                  )),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: FilledButton(
                        onPressed: () async {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (state.formKey.currentState!.validate()) {
                            logic.login();
                            state.verifyState.value = SendingBtnSate.sending;

                            Future.delayed(const Duration(seconds: 1), () {
                              state.verifyState.value = SendingBtnSate.success;

                              Future.delayed(const Duration(seconds: 1), () {
                                state.verifyState.value =
                                    SendingBtnSate.sending;

                                Future.delayed(const Duration(seconds: 1), () {
                                  // Process data.
                                  state.verifyState.value =
                                      SendingBtnSate.failed;

                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    state.verifyState.value =
                                        SendingBtnSate.normal;
                                    Get.back();
                                  });
                                  // Process data.
                                });
                              });
                            });
                            // Process data.
                          }
                        },
                        child: Flex(
                          mainAxisSize: MainAxisSize.min,
                          direction: Axis.horizontal,
                          children: [
                            const Spacer(),
                            Flexible(
                                flex: 3,
                                child: Obx(() {
                                  return AnimatedSwitcher(
                                      transitionBuilder: (child, anim) {
                                        return ScaleTransition(
                                          scale: anim,
                                          child: child,
                                        );
                                      },
                                      duration:
                                          const Duration(milliseconds: 150),
                                      child: SizedBox(
                                          width: 22,
                                          height: 22,
                                          key: ValueKey(
                                              state.verifyState.value.value),
                                          child: btnIconList[
                                              state.verifyState.value.value]));
                                })),
                            const Spacer(),
                            const Flexible(flex: 3, child: Text('登录')),
                            const Spacer()
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
