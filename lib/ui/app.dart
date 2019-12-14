import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_feed/business_logic/bloc.dart';
import 'package:photo_feed/repository/repository.dart';
import 'package:photo_feed/ui/widgets.dart';

class App extends StatelessWidget {
  final PhotosRepository photosRepository;

  App({@required this.photosRepository}): assert(photosRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickr Photo Feed',
      home: BlocProvider(
        create: (context) => PhotoFeedBloc(photosRepository: photosRepository),
        child: PhotoFeed(),
      )
    );
  }
}