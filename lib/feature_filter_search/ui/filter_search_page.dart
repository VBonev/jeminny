import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_ui/text_styles.dart';
import '../../models/search_model.dart';
import '../bloc/filter_cubit.dart';
import '../../common_ui/form_scaffold.dart';
import '../../common_ui/submit_button.dart';
import 'form_text.dart';
import 'filter_field.dart';

class FilterSearchPage extends StatelessWidget {
  FilterSearchPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormsScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if (state is FilterError) {
              return const Center(
                  child: Text(
                'Error loading data',
                style: TextStyles.headline4,
              ));
            } else if (state is FilterLoaded) {
              final savedSearches = state.searches;
              final selectedSearch = state.selectedSearch;
              final isFormValid = state.isFormValid;
              return Form(
                key: formKey,
                child: ListView(
                  children: [
                    FilterField(
                      label: 'Saved Searches',
                      items: savedSearches.map((e) => e.title).toSet(),
                      itemSelected: (selectedItem) {
                        FilterCubit.of(context).selectSearch(selectedItem);
                      },
                      initialValue: selectedSearch?.title,
                    ),
                    const Text(
                      'Filter',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 20),
                    FilterField(
                      label: 'Platform',
                      items: const {'Salesforce', 'HubSpot'},
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
                      label: 'Team members',
                      items: const {'Alice', 'Tom', 'Lauren'},
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
                        isFormValid: isFormValid,
                        selectedSearch: selectedSearch)
                  ],
                ),
              );
            }
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const CircularProgressIndicator(
                color: Color(0xffFF3E80),
              ),
            );
          },
        ),
      ),
    );
  }
}
