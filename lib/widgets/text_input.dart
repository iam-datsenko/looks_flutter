import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final String value;
  final String labelText;
  final String hintText;
  final String? Function(String?) validate;
  final void Function(String?) setState;

  const CustomTextInput(
      {super.key,
      required this.value,
      required this.labelText,
      required this.hintText,
      required this.validate,
      required this.setState});

  @override
  CustomTextInputState createState() {
    return CustomTextInputState();
  }
}

class CustomTextInputState extends State<CustomTextInput> {
  late FocusNode inputFocusNode;
  late bool passwordHidden;

  @override
  void initState() {
    super.initState();

    passwordHidden = true;
    inputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: TextFormField(
          onChanged: widget.setState,
          validator: widget.validate,
          focusNode: inputFocusNode,
          onTapOutside: (event) => {inputFocusNode.unfocus()},
          obscureText: widget.labelText == 'Password' ||
                  widget.labelText == 'Confirm password'
              ? passwordHidden
              : false,
          keyboardType: widget.labelText == 'Phone'
              ? TextInputType.phone
              : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            suffixIcon: widget.labelText == 'Password' ||
                    widget.labelText == 'Confirm password'
                ? IconButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                    ),
                    onPressed: () {
                      setState(() {
                        passwordHidden = !passwordHidden;
                      });
                    },
                    icon: Icon(
                      passwordHidden ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ))
                : null,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            labelText: widget.labelText,
            hintText: widget.hintText,
          ),
        ));
  }
}
