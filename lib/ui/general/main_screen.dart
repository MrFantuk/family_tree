
import 'package:family_tree/ui/mobile/family_tree.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    ///  TODO: add logic on existing tree and user auth
    return const FamilyTree();
  }


}
