
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onchange});
  final List<String> size;
  final Function (String) onchange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectindex=0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          shrinkWrap:true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.size.length,

          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                selectindex=index;
                widget.onchange(widget.size[index]);
                setState(() {

                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 6),

                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: getselectcolorbackground(index == selectindex),
                  borderRadius: BorderRadius.circular(100),
                  //shape: BoxShape.circle,
                  border: Border.all(color:getselectcolor(index == selectindex) ),

                ),

                child:Text(widget.size[index],style:TextStyle(
                  color: getselectcolor(index==selectindex)

                ),)

              ),
            );

          }),

    );
  }

  Color getselectcolor(bool isselect){
    return isselect ? Colors.white:Colors.black;
  }

  Color getselectcolorbackground(bool isselect){
    return isselect ?AppColor.primaryColor:Colors.transparent;
  }
}