import 'package:family_tree/model/person.dart';
import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  final Person person;
  const PersonTile({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(person.img!),
        ),
        const SizedBox(height: 5,),
        Text(person.name)
      ],
    );
  }
}
