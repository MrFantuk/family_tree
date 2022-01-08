import 'dart:math';

import 'package:family_tree/data/dev_persons_list.dart';
import 'package:family_tree/widget/pages_template/ScaffoldDrawer.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import 'components/family_tree_person_tile.dart';
import 'family_tree2.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({Key? key}) : super(key: key);

  @override
  _FamilyTreeState createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  Widget build(BuildContext context) {
    return ScaffoldDrawer(
      extendBody: false,
      title: "Ивановы",
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Древо семьи"),
            ),
          ),
          Center(
            child: Padding(
              padding: const  EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FamilyTreeWithThreeLayers())),
                  child: const Text("Вариант #2")),
            ),
          ),
          renderFamilyTree()
        ],
      ),
    );
  }

  Widget renderFamilyTree() {
    return Expanded(
      child: InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.0001,
          maxScale: 10.6,
          child: GraphView(
            graph: graph,
            algorithm:
                BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
            paint: Paint()
              ..color = Colors.green
              ..strokeWidth = 1
              ..style = PaintingStyle.stroke,
            builder: (Node node) {
              // I can decide what widget should be shown here based on the id
              var a = node.key?.value as int;
              return rectangleWidget(a);
            },
          )),
    );
  }

  Random r = Random();

  Widget rectangleWidget(int? a) {
    return InkWell(
        onTap: () {
          // ignore: avoid_print
          print('clicked');
        },
        child: PersonTile(
          person: personsList.first,
        ));
  }

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node.Id(10);
    final node11 = Node.Id(11);
    final node12 = Node.Id(12);
    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    super.initState();
  }
}
