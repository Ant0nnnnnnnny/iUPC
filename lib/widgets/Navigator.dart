import 'package:flutter/material.dart';
import 'package:iupc/constants.dart';
class NavigationTransition extends StatefulWidget {
  const NavigationTransition(
      {super.key,
      required this.scaffoldKey,
      required this.navigationRail,
      required this.navigationBar,
      required this.appBar,
        required this.fab,
      required this.body});
  final Widget fab;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget navigationRail;
  final Widget navigationBar;
  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  State<NavigationTransition> createState() => _NavigationTransitionState();
}

class _NavigationTransitionState extends State<NavigationTransition> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return   checkIslandScape(context)
        ?
      Scaffold(
      floatingActionButton:widget.fab ,
      key: widget.scaffoldKey,
      appBar: widget.appBar,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            widget.body,
          ],
        ),
      ),
      bottomNavigationBar: widget.navigationBar
    ):Scaffold(key: widget.scaffoldKey,
        appBar: widget.appBar,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: <Widget>[
              widget.navigationRail,
              widget.body,
            ],
          ),
        )
    );
  }
}
