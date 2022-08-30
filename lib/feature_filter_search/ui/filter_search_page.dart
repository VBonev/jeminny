import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_ui/styles.dart';
import '../../constants.dart';
import '../../models/search_model.dart';
import '../../strings.dart';
import '../bloc/filter_cubit.dart';
import '../../common_ui/app_scaffold.dart';
import '../../common_ui/submit_button.dart';
import 'form_text.dart';
import 'filter_field.dart';

class FilterSearchPage extends StatelessWidget {
  FilterSearchPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Strings.filterDescription),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if (state is FilterError) {
              return Center(
                child: Text(
                  Strings.searchError,
                  style: TextStyles.errorStyle,
                ),
              );
            } else if (state is FilterLoaded) {
              final selectedSearch = state.selectedSearch;
              return ListView(
                children: [
                  FilterField(
                    label: Strings.searchLabel,
                    items: state.searches.map((e) => e.title).toSet(),
                    itemSelected: (selectedItem) {
                      FilterCubit.of(context).selectSearch(selectedItem);
                    },
                    initialValue: selectedSearch?.title,
                  ),
                  Text(
                    Strings.filterLabel,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 20),
                  FilterField(
                    label: Strings.platformLabel,
                    items: platforms,
                    itemSelected: (selectedItem) {
                      final tempSearch = SearchModel.from(
                        title: selectedSearch?.title ?? '',
                        platform: selectedItem,
                        teamMember: selectedSearch?.teamMember,
                        customer: selectedSearch?.customer,
                      );
                      FilterCubit.of(context).setFilter(tempSearch);
                    },
                    initialValue: selectedSearch?.platform,
                  ),
                  FilterField(
                    label: Strings.membersLabel,
                    items: members,
                    itemSelected: (selectedItem) {
                      final tempSearch = SearchModel.from(
                        title: selectedSearch?.title ?? '',
                        platform: selectedSearch?.platform,
                        teamMember: selectedItem,
                        customer: selectedSearch?.customer,
                      );
                      FilterCubit.of(context).setFilter(tempSearch);
                    },
                    initialValue: selectedSearch?.teamMember,
                  ),
                  FormText(
                    controller:
                        TextEditingController(text: selectedSearch?.customer),
                    onChanged: (value) {
                      final tempSearch = SearchModel.from(
                        title: selectedSearch?.title ?? '',
                        platform: selectedSearch?.platform,
                        teamMember: selectedSearch?.teamMember,
                        customer: value,
                      );
                      FilterCubit.of(context).setFilter(tempSearch);
                    },
                  ),
                  const SizedBox(height: 40),
                  SubmitButton(
                      isFormValid: state.isFormValid,
                      selectedSearch: selectedSearch)
                ],
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
