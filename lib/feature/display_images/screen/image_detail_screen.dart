import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture/core/injector/injector.dart';
import 'package:nasa_picture/core/utils/app_utils.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

class ImageDetailScreen extends StatefulWidget {
  final int index;
  ImageDetailScreen({required this.index});
  @override
  _ImageDetailScreenState createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  late ImageDisplayBloc _imageDisplayBloc;

  @override
  void initState() {
    super.initState();
    _imageDisplayBloc = sl.get<ImageDisplayBloc>();
  }

  Widget _body(int index) {
    return Text(index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: widget.index),
      children: AppUtilities.map(
        list: _imageDisplayBloc.state.imageDataList!.images,
        handler: (index, ImageModel imageDetails) {
          return SingleChildScrollView(
            child: Hero(
              // transitionOnUser÷÷ssGestures: true,
              tag: "$index",
              child: CachedNetworkImage(
                imageUrl: imageDetails.url,
                placeholder: (context, url) => Image.asset('assets/nasa.jpeg'),
              ),
            ),
          );
        },
      ),
    );
  }
}
