import 'package:flutter/material.dart';
//import 'package:get/get_utils/get_utils.dart';
//import 'package:minconnect_mobile/app/utils/index_utils.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.prefixIconData,
    this.isPassword = false,
  });
  final String labelText;
  final String? hintText;
  final IconData? prefixIconData;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isFocused = false;
  late FocusNode _focusNode;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        // if (_focusNode.hasFocus) {
        //   _isFocused = true;
        // } else {
        //   _isFocused = false;
        // }
        _isFocused = _focusNode.hasFocus;
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _isFocused ? Colors.red : Colors.black12,
            width: _isFocused ? 2.0 : 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black45,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  widget.prefixIconData ?? null,
                  color: Colors.black87,
                  size: 22.0,
                ),
              ),
              Expanded(
                child: TextField(
                  obscureText:
                      widget.isPassword ? showPassword : widget.isPassword,
                  focusNode: _focusNode,
                  controller: widget.controller,
                  cursorHeight: 16.0,
                  cursorColor: Colors.black45,
                  cursorWidth: 3.0,
                  cursorRadius: const Radius.circular(10.0),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              if (widget.isPassword)
                SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: RawMaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      showPassword = !showPassword;
                      setState(() {});
                    },
                    child: Icon(
                      showPassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      size: 20.0,
                      color: const Color(0xFF841811),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
