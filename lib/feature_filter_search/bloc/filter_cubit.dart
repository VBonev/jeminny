import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/search_model.dart';
import '../repository/filter_repository.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._repository) : super(const FilterInitialState());
  final FilterRepository _repository;

  Future<void> init() async {
    emit(const FilterLoading());
    final filters = await _repository.fetchFilters();
    if (filters.isNotEmpty) {
      emit(FilterLoaded(filters, null));
    } else {
      emit(FilterError());
    }
  }

  void selectSearch(String? title) {
    var searches = (state as FilterLoaded).searches;
    final selectedSearch = title != null
        ? searches.firstWhere((element) => element.title == title)
        : null;
    setFilter(selectedSearch);
  }

  void setFilter(SearchModel? model) {
    var searches = (state as FilterLoaded).searches;

    var isFormValid = model?.platform?.isNotEmpty == true ||
        model?.teamMember?.isNotEmpty == true ||
        model?.customer?.isNotEmpty == true;
    emit(FilterLoaded(
      searches,
      model,
      isFormValid: isFormValid,
    ));
  }

  static FilterCubit of(BuildContext context) =>
      BlocProvider.of<FilterCubit>(context);
}
