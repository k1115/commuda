import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/thread_bookmark_button/thread_bookmark_button_widget.dart';
import '/pages/community/threads/components/thread_more_button/thread_more_button_widget.dart';
import 'community_thread_item_widget.dart' show CommunityThreadItemWidget;
import 'package:flutter/material.dart';

class CommunityThreadItemModel
    extends FlutterFlowModel<CommunityThreadItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ThreadBookmarkButton component.
  late ThreadBookmarkButtonModel threadBookmarkButtonModel;
  // Model for threadMoreButton component.
  late ThreadMoreButtonModel threadMoreButtonModel;

  @override
  void initState(BuildContext context) {
    threadBookmarkButtonModel =
        createModel(context, () => ThreadBookmarkButtonModel());
    threadMoreButtonModel = createModel(context, () => ThreadMoreButtonModel());
  }

  @override
  void dispose() {
    threadBookmarkButtonModel.dispose();
    threadMoreButtonModel.dispose();
  }
}
