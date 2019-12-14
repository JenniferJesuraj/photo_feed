import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PhotoFeedEvent extends Equatable {
  const PhotoFeedEvent();
}

class SearchQueryEntered extends PhotoFeedEvent {
  final String query;

  const SearchQueryEntered({
    @required this.query,
  }) : assert(query != null);

  @override
  List<Object> get props => [query]; 
}