import 'package:flutter/material.dart';

import '../../common_ui/text_styles.dart';
import '../../models/meeting_model.dart';
import '../../strings.dart';
import '../../utils/date_time_formatter.dart';
import 'icon_counter.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    required this.meeting,
    Key? key,
  }) : super(key: key);

  final MeetingModel meeting;

  static const _borderRadius = BorderRadius.all(Radius.circular(12));

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          border: Border.all(
            color: AppColors.grey40,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F190134),
              offset: Offset(0, 2),
              blurRadius: 10,
            ),
          ],
          color: AppColors.grey00,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        meeting.title,
                        maxLines: 2,
                        style: TextStyles.subheading,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(meeting.userPhoto ?? ''),
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                    Strings.meetingSubtitle(
                      dateTime1.format(
                        DateTime.parse(meeting.noteTakerAddedOn ?? ''),
                      ),
                    ),
                    style: TextStyles.caption),
                const SizedBox(height: 10),
                Text(dateTime1.format(DateTime.parse(meeting.createdAt ?? '')),
                    textAlign: TextAlign.end, style: TextStyles.caption),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IconCounter(icon: Icons.star_outline_rounded),
                    const IconCounter(
                      icon: Icons.emergency_recording,
                      count: 2,
                    ),
                    const IconCounter(icon: Icons.messenger_outline),
                    const IconCounter(
                      icon: Icons.slow_motion_video,
                      count: 5,
                    ),
                    Text(meeting.timeAgo ?? '', style: TextStyles.caption),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
