import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:photo_feed/model/photo.dart';

abstract class PhotoFeedState extends Equatable {
  const PhotoFeedState();

  @override
  List<Object> get props => [];
}

class PhotoFeedEmpty extends PhotoFeedState {}

class PhotoFeedLoadInProgress extends PhotoFeedState {}

class PhotoFeedLoadSuccess extends PhotoFeedState {
  final List<Photo> photos;

  const PhotoFeedLoadSuccess({@required this.photos}) : assert(photos != null);

  @override
  List<Object> get props => [photos];
}

class PhotoFeedLoadError extends PhotoFeedState {}

