import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/information/components/information_paragraph/information_paragraph_widget.dart';
import '/index.dart';
import 'information_detail_widget.dart' show InformationDetailWidget;
import 'package:flutter/material.dart';

class InformationDetailModel extends FlutterFlowModel<InformationDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for InformationParagraph dynamic component.
  late FlutterFlowDynamicModels<InformationParagraphModel>
      informationParagraphModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;

  @override
  void initState(BuildContext context) {
    informationParagraphModels =
        FlutterFlowDynamicModels(() => InformationParagraphModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
  }

  @override
  void dispose() {
    informationParagraphModels.dispose();
    appNavBarModel.dispose();
  }
}
