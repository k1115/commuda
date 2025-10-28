import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/detail/components/community_thread_item/community_thread_item_widget.dart';
import '/pages/home/components/home_community_item/home_community_item_widget.dart';
import '/index.dart';
import 'book_mark_widget.dart' show BookMarkWidget;
import 'package:flutter/material.dart';

class BookMarkModel extends FlutterFlowModel<BookMarkWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for HomeCommunityItem dynamic component.
  late FlutterFlowDynamicModels<HomeCommunityItemModel> homeCommunityItemModels;
  // Models for CommunityThreadItem dynamic component.
  late FlutterFlowDynamicModels<CommunityThreadItemModel>
      communityThreadItemModels;
  // State field(s) for searchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    homeCommunityItemModels =
        FlutterFlowDynamicModels(() => HomeCommunityItemModel());
    communityThreadItemModels =
        FlutterFlowDynamicModels(() => CommunityThreadItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    homeCommunityItemModels.dispose();
    communityThreadItemModels.dispose();
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();
  }
}
