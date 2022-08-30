import 'package:flutter/material.dart';
import '../../common_ui/styles.dart';
import '../../strings.dart';

class FormText extends StatefulWidget {
  const FormText({
    required this.onChanged,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String?) onChanged;

  @override
  State<FormText> createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.customerLabel,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Container(
            decoration: const BoxDecoration(
              color: AppColors.grey40,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: TextField(
              onChanged: (value) {
                widget.onChanged.call(value);
                setState(() {
                  widget.controller.text = value;
                });
              },
              controller: widget.controller
                ..selection = TextSelection.collapsed(
                    offset: widget.controller.text.length),
              style: TextStyles.body1,
              decoration: InputDecoration(
                  suffixIcon: widget.controller.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: AppColors.grey70,
                          ),
                          onPressed: () => setState(
                            () {
                              widget.controller.clear();
                              widget.onChanged.call(null);
                            },
                          ),
                        ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyles.hint,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  hintText: Strings.customerHint),
            )),
      ],
    );
  }
}
