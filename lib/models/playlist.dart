import 'package:flutter/material.dart';
import 'package:myapp/models/songs.dart';


class PlaylistProvider extends ChangeNotifier{
  final List <Songs> _playlist = [];
}