import '/components/comment_reaction/comment_reaction_widget.dart';
import '/components/image_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_thread_comment_widget.dart' show CommunityThreadCommentWidget;
import 'package:flutter/material.dart';

class CommunityThreadCommentModel
    extends FlutterFlowModel<CommunityThreadCommentWidget> {
  ///  Local state fields for this component.

  List<int> readUsers = [];
  void addToReadUsers(int item) => readUsers.add(item);
  void removeFromReadUsers(int item) => readUsers.remove(item);
  void removeAtIndexFromReadUsers(int index) => readUsers.removeAt(index);
  void insertAtIndexInReadUsers(int index, int item) =>
      readUsers.insert(index, item);
  void updateReadUsersAtIndex(int index, Function(int) updateFn) =>
      readUsers[index] = updateFn(readUsers[index]);

  ///  State fields for stateful widgets in this component.

  // Model for ImageView component.
  late ImageViewModel imageViewModel;
  // Model for CommentReaction component.
  late CommentReactionModel commentReactionModel1;
  // Model for CommentReaction component.
  late CommentReactionModel commentReactionModel2;
  // Model for CommentReaction component.
  late CommentReactionModel commentReactionModel3;
  // Model for CommentReaction component.
  late CommentReactionModel commentReactionModel4;

  @override
  void initState(BuildContext context) {
    imageViewModel = createModel(context, () => ImageViewModel());
    commentReactionModel1 = createModel(context, () => CommentReactionModel());
    commentReactionModel2 = createModel(context, () => CommentReactionModel());
    commentReactionModel3 = createModel(context, () => CommentReactionModel());
    commentReactionModel4 = createModel(context, () => CommentReactionModel());
  }

  @override
  void dispose() {
    imageViewModel.dispose();
    commentReactionModel1.dispose();
    commentReactionModel2.dispose();
    commentReactionModel3.dispose();
    commentReactionModel4.dispose();
  }
}
