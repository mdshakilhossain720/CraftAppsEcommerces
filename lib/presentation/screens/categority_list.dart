import 'package:craftproject/presentation/state_holder/category_list_controller.dart';
import 'package:craftproject/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/centerd_circular_progress.dart';

class CategorityList extends StatelessWidget {
  const CategorityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categority"),
      ),
      body:
          GetBuilder<CategoryListController>(builder: (categoryListController) {
            if(categoryListController.inprogress){
              return CircularProgressIndactor();
            }
        return RefreshIndicator(
          onRefresh: () async {
           await categoryListController.getCategory();
          },
          child: GridView.builder(
              itemCount: categoryListController.categoryList.length,
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                      child: CategroyItems(
                    category: categoryListController.categoryList[index],
                  )),
                );
              }),
        );
      }),
    );
  }
}
