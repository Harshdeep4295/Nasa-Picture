import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_picture/core/injector/injector.dart';
import 'package:nasa_picture/core/styles/app_styles.dart';
import 'package:nasa_picture/core/utils/app_utils.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

class ImageDetailScreen extends StatefulWidget {
  ImageDetailScreen();
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

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(
        initialPage: _imageDisplayBloc.state.index,
        keepPage: true,
      ),
      children: AppUtilities.map(
        list: _imageDisplayBloc.state.imageDataList!.images,
        handler: (index, ImageModel imageDetails) {
          return Scaffold(
            appBar: AppBar(
              title: AppStyle.textField(imageDetails.title, 22),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(1.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Hero(
                          tag: "$index",
                          child: Opacity(
                            opacity: 0.9,
                            child: CachedNetworkImage(
                              imageUrl: imageDetails.url,
                              placeholder: (context, url) =>
                                  Image.asset('assets/nasa.jpeg'),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [Colors.black, Colors.grey],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: imageDetails.copyright.isNotEmpty,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30.0,
                                right: 20,
                              ),
                              child: AppStyle.textField(
                                  "©" + imageDetails.copyright, 14.0,
                                  color: Colors.white,
                                  textAlign: TextAlign.end),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              right: 10,
                            ),
                            child: AppStyle.textField(
                              "Pulished on: " +
                                  DateFormat.yMMMd().format(imageDetails.date),
                              12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AppStyle.textField(imageDetails.explanation, 14.0),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
