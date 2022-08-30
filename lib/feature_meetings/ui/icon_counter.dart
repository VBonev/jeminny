import 'package:flutter/material.dart';

import '../../common_ui/styles.dart';

class IconCounter extends StatelessWidget {
  const IconCounter({
    required this.icon,
    this.count = 0,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.pink,
          size: 26,
        ),
        const SizedBox(width: 5),
        Text(count.toString(),
            style: TextStyles.caption.copyWith(
              color: AppColors.pink,
            )),
      ],
    );
  }
}
