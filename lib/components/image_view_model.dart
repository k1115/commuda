import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'image_view_widget.dart' show ImageViewWidget;
import 'package:flutter/material.dart';

class ImageViewModel extends FlutterFlowModel<ImageViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ImageComponent dynamic component.
  late FlutterFlowDynamicModels<ImageComponentModel> imageComponentModels;

  @override
  void initState(BuildContext context) {
    imageComponentModels =
        FlutterFlowDynamicModels(() => ImageComponentModel());
  }

  @override
  void dispose() {
    imageComponentModels.dispose();
  }
}
