import 'package:flutter/material.dart';

import 'text_styles.dart';

class FormDropdown extends StatefulWidget {
  FormDropdown({
    required this.menuItems,
    required this.onOptionSelected,
    required this.hint,
    this.itemSelected,
    Key? key,
  }) : super(key: key);

  String? itemSelected;
  final Set<String?> menuItems;
  final Function(String? item) onOptionSelected;
  final String? hint;

  @override
  FormDropdownState createState() => FormDropdownState();
}

class FormDropdownState extends State<FormDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              isShow = !isShow;
              _runExpandCheck();
              setState(() {});
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.grey40,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    widget.itemSelected ?? 'Select ${widget.hint ?? 'value'}',
                    style: widget.itemSelected != null
                        ? TextStyles.body1
                        : TextStyles.hint,
                  )),
                  if (widget.itemSelected != null)
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.itemSelected = null;
                              isShow = false;
                              expandController.reverse();
                              widget.onOptionSelected(null);
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.grey70,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 15)
                      ],
                    ),
                  Align(
                    alignment: const Alignment(1, 0),
                    child: Icon(
                      isShow
                          ? Icons.keyboard_arrow_up_sharp
                          : Icons.keyboard_arrow_down_sharp,
                      color: AppColors.grey70,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            axisAlignment: 1,
            sizeFactor: animation,
            child: _buildDropListOptions(widget.menuItems, context),
          ),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      );

  Padding _buildDropListOptions(Set<String?> items, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: const Color(0xffE0E0E0),
              width: 1,
            ),
          ),
          child: Column(
            children:
                items.map((item) => _buildSubMenu(item, context)).toList(),
          ),
        ),
      );

  Widget _buildSubMenu(String? item, BuildContext context) => item != null
      ? InkWell(
          onTap: () {
            setState(() {
              widget.itemSelected = item;
              isShow = false;
              expandController.reverse();
            });
            widget.onOptionSelected(item);
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        left: 12,
                      ),
                      child: Text(
                        item,
                        textAlign: TextAlign.start,
                      )),
                ),
              ),
            ],
          ),
        )
      : const SizedBox.shrink();
}
