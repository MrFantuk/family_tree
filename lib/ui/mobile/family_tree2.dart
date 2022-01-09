import 'package:family_tree/data/dev_persons_list.dart';
import 'package:family_tree/model/person.dart';
import 'package:flutter/material.dart';

import 'components/family_tree_person_tile.dart';

class FamilyTreeWithThreeLayers extends StatelessWidget {
  const FamilyTreeWithThreeLayers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вариант №2"),
      ),
      body: Column(
        children: [
          buildListView(context, personsList),
          buildListView(context, personsList2),
          buildListView(context, personsList3),
        ],
      ),
    );
  }
}

Widget buildListView(context, List<Person> list) {
  return Expanded(
    flex: 2,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.2,
                  crossAxisCount: 1),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PersonTile(person: list[index]),
                // Container(
                //       height: 70,
                //       width: 120,
                //       margin: const EdgeInsets.symmetric(horizontal: 15),
                //       decoration: BoxDecoration(
                //           image: DecorationImage(image: AssetImage(list[index].img!), fit: BoxFit.cover),
                //           borderRadius: BorderRadius.circular(10.0)),
                //     ),
                 
              ],
            )),
      ),
    ),
  );
}
