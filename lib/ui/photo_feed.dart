import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_feed/business_logic/bloc.dart';
import 'package:photo_feed/ui/widgets.dart';

class PhotoFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Photo Feed'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final query = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
              if (query != null) {
                BlocProvider.of<PhotoFeedBloc>(context)
                    .add(SearchQueryEntered(query: query));
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<PhotoFeedBloc, PhotoFeedState>(
        builder: (context, state) {
          if (state is PhotoFeedEmpty) {
            return Center(
              child: Text('Press the search icon to look for pictures'),
            );
          }
          if (state is PhotoFeedLoadInProgress) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.black87,
              ),
            ));
          }
          if (state is PhotoFeedLoadError) {
            return Text('Something went wrong!');
          }
          if (state is PhotoFeedLoadSuccess) {
            return GridView.builder(
              itemCount: state.photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  state.photos[index].url_s,
                  fit: BoxFit.cover,
                );
              },
            );
          }
          return Text('No results found');
        },
      ),
    );
  }
}
