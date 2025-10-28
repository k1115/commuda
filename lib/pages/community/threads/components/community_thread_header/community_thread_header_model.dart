import '/backend/supabase/supabase.dart';
import '/components/image_view_widget.dart';
import '/components/timeline_reaction/timeline_reaction_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/thread_bookmark_button/thread_bookmark_button_widget.dart';
import '/pages/community/threads/components/thread_more_button/thread_more_button_widget.dart';
import 'community_thread_header_widget.dart' show CommunityThreadHeaderWidget;
import 'package:flutter/material.dart';

class CommunityThreadHeaderModel
    extends FlutterFlowModel<CommunityThreadHeaderWidget> {
  ///  Local state fields for this component.

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  final communityThreadHeaderShortcutsFocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in TimelineHeader widget.
  List<UserWithProfileRow>? creatorOutput;
  // Model for ThreadBookmarkButton component.
  late ThreadBookmarkButtonModel threadBookmarkButtonModel;
  // Model for threadMoreButton component.
  late ThreadMoreButtonModel threadMoreButtonModel;
  // Model for ImageView component.
  late ImageViewModel imageViewModel;
  // Model for TimelineReaction component.
  late TimelineReactionModel timelineReactionModel1;
  // Model for TimelineReaction component.
  late TimelineReactionModel timelineReactionModel2;
  // Model for TimelineReaction component.
  late TimelineReactionModel timelineReactionModel3;
  // Model for TimelineReaction component.
  late TimelineReactionModel timelineReactionModel4;
  // Stores action output result for [Backend Call - Query Rows] action in TimelineCommentCount widget.
  List<CommunityThreadDetailsRow>? threadOutput;

  @override
  void initState(BuildContext context) {
    threadBookmarkButtonModel =
        createModel(context, () => ThreadBookmarkButtonModel());
    threadMoreButtonModel = createModel(context, () => ThreadMoreButtonModel());
    imageViewModel = createModel(context, () => ImageViewModel());
    timelineReactionModel1 =
        createModel(context, () => TimelineReactionModel());
    timelineReactionModel2 =
        createModel(context, () => TimelineReactionModel());
    timelineReactionModel3 =
        createModel(context, () => TimelineReactionModel());
    timelineReactionModel4 =
        createModel(context, () => TimelineReactionModel());
  }

  @override
  void dispose() {
    communityThreadHeaderShortcutsFocusNode.dispose();
    threadBookmarkButtonModel.dispose();
    threadMoreButtonModel.dispose();
    imageViewModel.dispose();
    timelineReactionModel1.dispose();
    timelineReactionModel2.dispose();
    timelineReactionModel3.dispose();
    timelineReactionModel4.dispose();
  }
}
