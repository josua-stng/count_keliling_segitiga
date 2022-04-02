import 'package:flutter/material.dart';
class Keliling extends StatelessWidget {
  final TextEditingController BoxSegitiga;
  final bool? conditionItems;
   Keliling({Key? key, required this.BoxSegitiga, required this.conditionItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 100,
    child: TextField(
      controller: BoxSegitiga,
      decoration: InputDecoration(
        hintText: '0',
        border: OutlineInputBorder(),
        errorText: conditionItems== true? 'Harus sama': null
      ),
    ),
    );
  }
}