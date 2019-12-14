import 'package:bloc/bloc.dart';
import 'package:photo_feed/business_logic/bloc.dart';
import 'package:photo_feed/model/photo.dart';
import 'package:photo_feed/repository/repository.dart';
import 'package:meta/meta.dart';

class PhotoFeedBloc extends Bloc<PhotoFeedEvent, PhotoFeedState> {
  final PhotosRepository photosRepository;

  PhotoFeedBloc({@required this.photosRepository})
      : assert(photosRepository != null);

  @override
  get initialState => PhotoFeedEmpty();

  @override
  Stream<PhotoFeedState> mapEventToState(PhotoFeedEvent event) async* {
    if (event is SearchQueryEntered) {
      yield PhotoFeedLoadInProgress();
      try {
        final List<Photo> photos =
            await photosRepository.getPhotos(event.query);
          yield PhotoFeedLoadSuccess(photos: photos);
      } catch (_) {
        yield PhotoFeedLoadError();
      }
    }
  }
}
