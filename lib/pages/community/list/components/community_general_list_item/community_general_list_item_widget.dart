import '/backend/supabase/supabase.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'community_general_list_item_model.dart';
export 'community_general_list_item_model.dart';

class CommunityGeneralListItemWidget extends StatefulWidget {
  const CommunityGeneralListItemWidget({
    super.key,
    required this.community,
  });

  final CommunityWithImageRow? community;

  @override
  State<CommunityGeneralListItemWidget> createState() =>
      _CommunityGeneralListItemWidgetState();
}

class _CommunityGeneralListItemWidgetState
    extends State<CommunityGeneralListItemWidget> {
  late CommunityGeneralListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityGeneralListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.commuityMembers = await CommunityMembersTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'community_id',
                widget.community?.id,
              )
              .eqOrNull(
                'user_id',
                FFAppState().userInfo.id,
              )
              .eqOrNull(
                'participate_status',
                1,
              ),
        );

        context.pushNamed(
          CommunityDetailWidget.routeName,
          queryParameters: {
            'community': serializeParam(
              widget.community,
              ParamType.SupabaseRow,
            ),
            'isShow': serializeParam(
              ((widget.community?.privacyType == 0) ||
                      (widget.community?.privacyType == 1) ||
                      (widget.community?.privacyType == 2)) ||
                  (((widget.community?.privacyType == 3) ||
                          (widget.community?.privacyType == 4)) &&
                      (_model.commuityMembers != null &&
                          (_model.commuityMembers)!.isNotEmpty)),
              ParamType.bool,
            ),
            'isInvite': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        safeSetState(() {});
      },
      child: Container(
        width: (MediaQuery.sizeOf(context).width - 2) / 2,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).originalColorWhite,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(7.25, 8.0, 7.25, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: OctoImage(
                    placeholderBuilder: (_) => SizedBox.expand(
                      child: Image(
                        image: BlurHashImage('HASHBLUESTRING'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    image: NetworkImage(
                      widget.community!.imageUrl!,
                    ),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 86.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 42.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.community?.name,
                          '-',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.notoSansJp(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.communityCountsRowModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CommunityCountsRowWidget(
                            community: widget.community!,
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ]
                      .divide(SizedBox(height: 8.0))
                      .addToStart(SizedBox(height: 8.0))
                      .addToEnd(SizedBox(height: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: wrapWithModel(
                  model: _model.communityButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CommunityButtonWidget(
                    communityId: widget.community?.id,
                    creatorId: widget.community!.creatorId!,
                    privacyType: widget.community!.privacyType!,
                    communityName: widget.community!.name!,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
