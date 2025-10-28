import '/components/outline_button/outline_button_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  bool showImage = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for OutlineButton component.
  late OutlineButtonModel outlineButtonModel;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    outlineButtonModel = createModel(context, () => OutlineButtonModel());
  }

  @override
  void dispose() {
    primaryButtonModel.dispose();
    outlineButtonModel.dispose();
  }
}
