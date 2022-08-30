part of 'filter_cubit.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterInitialState extends FilterState {
  const FilterInitialState();
}

class FilterLoading extends FilterState {
  const FilterLoading();
}

class FilterLoaded extends FilterState {
  const FilterLoaded(
    this.searches,
    this.selectedSearch, {
    this.isFormValid,
  });

  final List<SearchModel> searches;
  final SearchModel? selectedSearch;
  final bool? isFormValid;

  @override
  List<Object?> get props => [searches, selectedSearch, isFormValid];
}

class FilterError extends FilterState {}
