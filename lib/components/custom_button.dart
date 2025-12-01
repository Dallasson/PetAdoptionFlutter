import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function() onClick;
  const CustomButton({super.key , required this.text , required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black87
        ),
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
