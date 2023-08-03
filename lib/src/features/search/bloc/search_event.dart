part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchNameEvent extends SearchEvent {
  final String keyword;
  final int no;
  final int limit;

  const SearchNameEvent(this.keyword, this.no,this.limit,);
}
