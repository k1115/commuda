import '/backend/supabase/supabase.dart';
import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community_comment_item_model.dart';
export 'community_comment_item_model.dart';

class CommunityCommentItemWidget extends StatefulWidget {
  const CommunityCommentItemWidget({
    super.key,
    required this.community,
    bool? isSelected,
  }) : this.isSelected = isSelected ?? false;

  final CommunityWithImageRow? community;
  final bool isSelected;

  @override
  State<CommunityCommentItemWidget> createState() =>
      _CommunityCommentItemWidgetState();
}

class _CommunityCommentItemWidgetState
    extends State<CommunityCommentItemWidget> {
  late CommunityCommentItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityCommentItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 53.0,
              height: 53.0,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          border: Border.all(
                            color: widget.isSelected
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).gray20,
                          ),
                        ),
                        child: wrapWithModel(
                          model: _model.imageComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ImageComponentWidget(
                            imagePath: widget.community!.imageUrl!,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: widget.isSelected,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/green_check.svg',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.community?.name,
                  '子育てとご飯のコミュニティ子育てとご飯のコミュニティ子育てとご飯のコミュニティ子育てとご飯のコミュニティ',
                ).maybeHandleOverflow(
                  maxChars: 18,
                  replacement: '…',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
