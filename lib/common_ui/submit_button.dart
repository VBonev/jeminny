import 'package:flutter/material.dart';

import '../feature_meetings/ui/meetings_page.dart';
import '../models/search_model.dart';
import 'text_styles.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.isFormValid,
    required this.selectedSearch,
  }) : super(key: key);

  final bool? isFormValid;
  final SearchModel? selectedSearch;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        primary: isFormValid == true ? Colors.white : AppColors.grey80,
        textStyle: TextStyles.body2,
        backgroundColor:
            isFormValid == true ? AppColors.pink : AppColors.grey40,
      ),
      onPressed: isFormValid == true
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeetingsPage(selectedSearch),
                ),
              );
            }
          : null,
      child: const SizedBox(
        height: 30,
        child: Center(
          child: Text(
            'Show Results',
          ),
        ),
      ),
    );
  }
}
