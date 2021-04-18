import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nasa_picture/core/injector/injector.dart';
import 'package:nasa_picture/core/styles/app_styles.dart';
import 'package:nasa_picture/core/utils/app_utils.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_event.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';
import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

class ImageGridScreen extends StatefulWidget {
  @override
  _ImageGridScreenState createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen> {
  late ImageDisplayBloc _imageDisplayBloc;

  @override
  void initState() {
    super.initState();
    _imageDisplayBloc = sl.get<ImageDisplayBloc>();
  }

  Widget _body(ImageScreenState state) {
    if (state.imageDataList != null) {
      return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: state.imageDataList!.images.length,
          itemBuilder: (BuildContext context, int index) {
            ImageModel imageDetails =
                state.imageDataList!.getImageModelAt(index);
            return InkWell(
              onTap: () => _imageDisplayBloc.add(
                ImageClickEvent(index),
              ),
              child: Hero(
                  transitionOnUserGestures: true,
                  tag: "$index",
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CachedNetworkImage(
                      imageUrl: imageDetails.url,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Image.asset('assets/nasa.jpeg'),
                    ),
                  )),
            );
          },
          shrinkWrap: true,
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(1));
    } else {
      return Container(
          child: Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyle.textField("Nasa Pictures", 22),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _imageDisplayBloc,
        child: BlocBuilder(
          bloc: _imageDisplayBloc,
          builder: (context, ImageScreenState state) {
            return _body(state);
          },
        ),
      ),
    );
  }
}
