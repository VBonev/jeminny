import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_ui/app_scaffold.dart';
import '../../common_ui/styles.dart';
import '../../models/search_model.dart';
import '../../strings.dart';
import '../bloc/meetings_cubit.dart';
import '../repository/meeting_repository.dart';
import 'meeting_item.dart';

class MeetingsPage extends StatelessWidget {
  const MeetingsPage(
    this.selectedSearch, {
    Key? key,
  }) : super(key: key);
  final SearchModel? selectedSearch;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingsCubit(
        const MeetingsRepository(),
      )..filterSearches(selectedSearch),
      child: AppScaffold(
        onTap: () {
          Navigator.of(context).pop();
        },
        body: BlocBuilder<MeetingsCubit, MeetingsState>(
          builder: (context, state) {
            if (state is MeetingsError) {
              return Center(
                child: Text(
                  Strings.meetingsError,
                  style: TextStyles.errorStyle,
                ),
              );
            } else if (state is MeetingsLoaded) {
              final meetings = state.meetings;
              return ListView.builder(
                itemCount: meetings.length,
                itemBuilder: (context, index) => MeetingCard(
                  meeting: meetings[index],
                ),
              );
            }
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const CircularProgressIndicator(
                color: AppColors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
}
