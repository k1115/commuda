import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_ranking_item_model.dart';
export 'home_ranking_item_model.dart';

class HomeRankingItemWidget extends StatefulWidget {
  const HomeRankingItemWidget({
    super.key,
    required this.community,
    required this.ranking,
    required this.userId,
    required this.friendList,
  });

  final CommunityWithImageRow? community;
  final int? ranking;
  final int? userId;
  final List<int>? friendList;

  @override
  State<HomeRankingItemWidget> createState() => _HomeRankingItemWidgetState();
}

class _HomeRankingItemWidgetState extends State<HomeRankingItemWidget> {
  late HomeRankingItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeRankingItemModel());

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
        _model.communityMemberOutput = await CommunityMembersTable().queryRows(
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
                      (_model.communityMemberOutput != null &&
                          (_model.communityMemberOutput)!.isNotEmpty)),
              ParamType.bool,
            ),
            'isInvite': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        safeSetState(() {});
      },
      child: Container(
        width: 240.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 126.0,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (widget.community?.imageUrl != null &&
                          widget.community?.imageUrl != '') {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget.community!.imageUrl!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/image-cover.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          wrapWithModel(
                            model: _model.communityBookmarkButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: CommunityBookmarkButtonWidget(
                              userId: widget.userId!,
                              community: widget.community!.id!,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.communityBottomSheetButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CommunityBottomSheetButtonWidget(
                              userId: widget.userId!,
                              community: widget.community!.id!,
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Container(
                      width: 48.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            (int no) {
                              return no.toString().padLeft(2, '0');
                            }(widget.ranking!),
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.community?.name,
                        'キャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれキャンプ好きあつまれ',
                      ).maybeHandleOverflow(
                        maxChars: 30,
                        replacement: '…',
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
                    wrapWithModel(
                      model: _model.communityCountsRowModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CommunityCountsRowWidget(
                        community: widget.community!,
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
