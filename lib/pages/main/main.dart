import 'package:flutter/material.dart';
import 'package:iupc/widgets/schedule/view.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Center(
          child:SchedulePage(height: 240,),
        )
      ],
    );
  }
}
