import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType textInputTypeee;
  final TextEditingController textEditingControllerr;
  final String hinttexttt;
  final Function? onchange;
  const MyTextField(
      {Key? key,
      required this.onchange,
      required this.textInputTypeee,
      required this.textEditingControllerr,
      required this.hinttexttt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (onchange){},
      controller: textEditingControllerr,
      keyboardType: textInputTypeee,
      decoration: InputDecoration(
        hintText: hinttexttt,
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}
