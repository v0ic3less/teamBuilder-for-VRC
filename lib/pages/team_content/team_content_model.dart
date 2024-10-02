import '/flutter_flow/flutter_flow_util.dart';
import 'team_content_widget.dart' show TeamContentWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TeamContentModel extends FlutterFlowModel<TeamContentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
