import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_feed/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:photo_feed/ui/widgets.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final PhotosRepository photosRepository = PhotosRepository(
    apiClient: FlickrApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(App(
    photosRepository: photosRepository,
  ));
}
