part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];

 
}
 class SearchNameEvent extends SearchEvent{
   final String keyword;

  const SearchNameEvent(this.keyword);
}
 