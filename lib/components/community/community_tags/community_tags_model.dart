import '/components/community/community_tag/community_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_tags_widget.dart' show CommunityTagsWidget;
import 'package:flutter/material.dart';

class CommunityTagsModel extends FlutterFlowModel<CommunityTagsWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for CommunityTag dynamic component.
  late FlutterFlowDynamicModels<CommunityTagModel> communityTagModels;

  @override
  void initState(BuildContext context) {
    communityTagModels = FlutterFlowDynamicModels(() => CommunityTagModel());
  }

  @override
  void dispose() {
    communityTagModels.dispose();
  }
}
