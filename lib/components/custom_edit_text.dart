import "package:flutter/material.dart";


class CustomEditText extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final IconData iconData;
  const CustomEditText({super.key,required this.hint,required this.textEditingController,
   required this.iconData});

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        hint: Text(widget.hint),
        suffixIcon: Icon(widget.iconData)
      ),
    );
  }
}
