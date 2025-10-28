import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_info_item/home_info_item_widget.dart';
import 'information_list_widget.dart' show InformationListWidget;
import 'package:flutter/material.dart';

class InformationListModel extends FlutterFlowModel<InformationListWidget> {
  ///  State fields for stateful widgets in this component.

  Stream<List<InformationsRow>>? informationSupabaseStream;
  // Model for HomeColumnTitle component.
  late HomeColumnTitleModel homeColumnTitleModel;
  // Models for HomeInfoItem dynamic component.
  late FlutterFlowDynamicModels<HomeInfoItemModel> homeInfoItemModels;

  @override
  void initState(BuildContext context) {
    homeColumnTitleModel = createModel(context, () => HomeColumnTitleModel());
    homeInfoItemModels = FlutterFlowDynamicModels(() => HomeInfoItemModel());
  }

  @override
  void dispose() {
    homeColumnTitleModel.dispose();
    homeInfoItemModels.dispose();
  }
}
