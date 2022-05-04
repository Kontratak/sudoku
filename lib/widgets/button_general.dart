import 'package:flutter/material.dart';

class ButtonGeneral extends StatelessWidget {
  ButtonGeneral({Key? key,required this.onTap, this.text, this.color}) : super(key: key);

  final dynamic onTap;
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        await onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white,width: 1.0,style: BorderStyle.solid)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(text ?? "Error",style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
