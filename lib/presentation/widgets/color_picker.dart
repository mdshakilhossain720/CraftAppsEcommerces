

import 'package:flutter/material.dart';
class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onchange});
  final List<Color> colors;
  final Function (Color) onchange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectindex=0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
          shrinkWrap:true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.colors.length,

          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                selectindex=index;
                widget.onchange(widget.colors[index]);
                setState(() {

                });
              },
              child: CircleAvatar(
                backgroundColor: widget.colors[index],
                child: selectindex == index ? const Icon(Icons.check,color: Colors.white,):null,

              ),
            );

          }),
    );
  }
}