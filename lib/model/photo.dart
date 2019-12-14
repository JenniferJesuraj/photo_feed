import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int farm;
  final int height_s;
  final String id;
  final int isfamily;
  final int isfriend;
  final int ispublic;
  final String owner;
  final String secret;
  final String server;
  final String title;
  final String url_s;
  final int width_s;

  const Photo({
    this.farm,
    this.height_s,
    this.id,
    this.isfamily,
    this.isfriend,
    this.ispublic,
    this.owner,
    this.secret,
    this.server,
    this.title,
    this.url_s,
    this.width_s,
  });

  @override
  List<Object> get props => [
    farm,
    height_s,
    id,
    isfamily,
    isfriend,
    ispublic,
    owner,
    secret,
    title,
    url_s,
    width_s
  ];

  @override
  String toString() => 'Photo {id: $id}';
}