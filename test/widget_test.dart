// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:photo_feed/repository/photos_repository.dart';
import 'package:photo_feed/ui/widgets.dart';

class MockPhotoRepository extends Mock implements PhotosRepository {}

void main() {
  PhotosRepository photosRepository = MockPhotoRepository();
  testWidgets('Tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App(
      photosRepository: photosRepository,
    ));
  });
}
