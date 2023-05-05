import 'package:flutter/material.dart';
import 'package:iupc/pages/account/account.dart';
import 'package:iupc/pages/main/main.dart';

import '../constants.dart';
import '../widgets/Navigator.dart';
import '../widgets/animator.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool controllerInitialized = false;
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;

  int screenIndex = ScreenSelected.home.value;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: transitionLength.toInt() * 2),
      value: 0,
      vsync: this,
    );
    railAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
      return NavigationTransition(
        scaffoldKey: scaffoldKey,
        animationController: controller,
        railAnimation: railAnimation,
        navigationRail: NavigationRail(
          extended: showLargeSizeLayout,
          destinations: navRailDestinations,
          selectedIndex: screenIndex,
          onDestinationSelected: (index) {
            setState(() {
              screenIndex = index;
              handleScreenChanged(screenIndex);
            });
          },
        ),
        navigationBar: NavigationBar(
          selectedIndex: screenIndex,
          onDestinationSelected: (index) {
            setState(() {
              screenIndex = index;
            });
          },
          destinations: appBarDestinations,
        ),
        appBar: createAppBar(),
        body: createScreenFor(
            ScreenSelected.values[screenIndex]),
      );
    });}


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
    return AppBar(
      title: const Text('数字石大'),
      actions: !showMediumSizeLayout && !showLargeSizeLayout
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

  Widget createScreenFor(
      ScreenSelected screenSelected) {
    switch (screenSelected) {
      case ScreenSelected.home:
        return const MainPage();
      case ScreenSelected.classes:
        return const MainPage();
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
    this.showTooltipBelow = true,
  });

  final Function handleBrightnessChange;
  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
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
          ColorSeed currentColor = ColorSeed.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor == colorSelected
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
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
