// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:theme_provider/theme_provider.dart';

import 'package:family_tree/ui/general/drawer.dart';

class ScaffoldDrawer extends StatefulWidget {
  final bool? extendBody;
  final String? title;
  final List<Widget>? actions;
  final Widget body;
  const ScaffoldDrawer(
      {Key? key, this.extendBody, this.title, required this.body, this.actions})
      : super(key: key);

  @override
  _ScaffoldDrawerState createState() => _ScaffoldDrawerState();
}

class _ScaffoldDrawerState extends State<ScaffoldDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.controllerOf(context).theme.data;
    return AdvancedDrawer(
      disabledGestures: true,
      backdropColor: theme.primaryColor.withOpacity(0.3),
      controller: _advancedDrawerController,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 1000),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Scaffold(
          extendBodyBehindAppBar:
              widget.extendBody != null ? widget.extendBody! : true,
          appBar: AppBar(
            titleSpacing: 0,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (context, value, child) {
                  return Icon(
                    _advancedDrawerController.value.visible
                        ? Icons.clear
                        : Icons.menu,
                  );
                },
              ),
            ),
            title: widget.title != null ? Text(widget.title!).tr() : null,
            automaticallyImplyLeading: true,
            backgroundColor: theme.primaryColor,
            elevation: 0.0,
            actions: widget.actions,
            
          ),
          body: widget.body),
      drawer: const DrawerSection(),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
