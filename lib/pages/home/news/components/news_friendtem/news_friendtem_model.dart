import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_bar/news_community_bar_widget.dart';
import 'news_friendtem_widget.dart' show NewsFriendtemWidget;
import 'package:flutter/material.dart';

class NewsFriendtemModel extends FlutterFlowModel<NewsFriendtemWidget> {
  ///  Local state fields for this component.

  List<int> userList = [];
  void addToUserList(int item) => userList.add(item);
  void removeFromUserList(int item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, int item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(int) updateFn) =>
      userList[index] = updateFn(userList[index]);

  bool disableButton = false;

  ///  State fields for stateful widgets in this component.

  // Model for NewsCommunityBar component.
  late NewsCommunityBarModel newsCommunityBarModel;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UserWithProfileRow>? userOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChatroomOverviewRow>? overviewOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ChatroomsRow? chatroomOutput;

  @override
  void initState(BuildContext context) {
    newsCommunityBarModel = createModel(context, () => NewsCommunityBarModel());
  }

  @override
  void dispose() {
    newsCommunityBarModel.dispose();
  }
}
