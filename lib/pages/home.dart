import 'package:flutter/material.dart';
import 'package:iupc/pages/account/view.dart';
import 'package:iupc/pages/class/view.dart';
import 'package:iupc/pages/main/main.dart';

import '../constants.dart';
import '../widgets/Navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.useLightMode,
    required this.useMaterial3,
    required this.colorSelected,
    required this.handleBrightnessChange,
    required this.handleColorSelect,
  });

  final bool useLightMode;
  final bool useMaterial3;
  final ColorSeed colorSelected;
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(int value) handleColorSelect;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int screenIndex = ScreenSelected.home.value;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('HOME: ${widget.colorSelected}');
    return NavigationTransition(
      fab: _generateFAB(),
      scaffoldKey: scaffoldKey,
      navigationRail: NavigationRail(
        groupAlignment: 0,
        labelType: MediaQuery.of(context).size.width>1000?null:NavigationRailLabelType.selected,
        destinations: navRailDestinations,
        selectedIndex: screenIndex,
        extended: MediaQuery.of(context).size.width>1000,
        leading: _generateFAB(),
        trailing: IconButton(icon: const Icon(Icons.settings),onPressed: (){}),
        onDestinationSelected: (index) {
          setState(() {
            screenIndex = index;
            handleScreenChanged(screenIndex);
          });
        },
      ),
      navigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: screenIndex,
        onDestinationSelected: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: appBarDestinations,
      ),
      appBar: createAppBar(),
      body: createScreenFor(ScreenSelected.values[screenIndex]),
    );
  }

  FloatingActionButton _generateFAB() {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: '搜索功能',
      isExtended: true,
      child: const Icon(Icons.search),
    );
  }

  void handleScreenChanged(int screenSelected) {
    setState(() {
      screenIndex = screenSelected;
    });
  }

  final List<NavigationRailDestination> navRailDestinations = appBarDestinations
      .map(
        (destination) => NavigationRailDestination(
          icon: Tooltip(
            message: destination.label,
            child: destination.icon,
          ),
          selectedIcon: Tooltip(
            message: destination.label,
            child: destination.selectedIcon,
          ),
          label: Text(destination.label),
        ),
      )
      .toList();

  PreferredSizeWidget createAppBar() {
    debugPrint((MediaQuery.of(context).size.height/MediaQuery.of(context).size.width).toString());
    return AppBar(
      title: const Text('i石大'),
      actions:MediaQuery.of(context).size.height/MediaQuery.of(context).size.width > narrowScreenHWRate
          ? [
              _BrightnessButton(
                handleBrightnessChange: widget.handleBrightnessChange,
              ),
              _ColorSeedButton(
                handleColorSelect: widget.handleColorSelect,
                colorSelected: widget.colorSelected,
              ),
            ]
          : [Container()],
    );
  }

  Widget createScreenFor(ScreenSelected screenSelected) {
    switch (screenSelected) {
      case ScreenSelected.home:
        return const MainPage();
      case ScreenSelected.classes:
        return const ClassPage();
      case ScreenSelected.affairs:
        return const AccountPage();
      case ScreenSelected.account:
        return const AccountPage();
      default:
        return const MainPage();
    }
  }
}

class _BrightnessButton extends StatelessWidget {
  const _BrightnessButton({
    required this.handleBrightnessChange,
  });

  final Function handleBrightnessChange;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: false,
      message: 'Toggle brightness',
      child: IconButton(
        icon: isBright
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () => handleBrightnessChange(!isBright),
      ),
    );
  }
}

class _ColorSeedButton extends StatelessWidget {
  const _ColorSeedButton({
    required this.handleColorSelect,
    required this.colorSelected,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton(
      icon: Icon(
        Icons.palette_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          return PopupMenuItem(
            value: index,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                   Icons.color_lens_outlined,
                    color: ColorSeed.values[index].color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(ColorSeed.values[index].label),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.home_outlined),
    label: '主页',
    selectedIcon: Icon(Icons.home),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.text_snippet_outlined),
    label: '教务系统',
    selectedIcon: Icon(Icons.text_snippet),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.class_outlined),
    label: '石大云课堂',
    selectedIcon: Icon(Icons.class_),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.account_circle_outlined),
    label: '个人',
    selectedIcon: Icon(Icons.account_circle_rounded),
  )
];
