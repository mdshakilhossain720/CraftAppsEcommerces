import 'package:craftproject/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategorityList extends StatelessWidget {
  const CategorityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categority"),
      ),
      body: GridView.builder(
        itemCount: 20,
          shrinkWrap: true,
          primary: false,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 0.75),
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: CategroyItems()),
            );
          }),
    );
  }
}
