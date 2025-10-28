import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_comment_item_widget.dart' show CommunityCommentItemWidget;
import 'package:flutter/material.dart';

class CommunityCommentItemModel
    extends FlutterFlowModel<CommunityCommentItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ImageComponent component.
  late ImageComponentModel imageComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
  }
}
