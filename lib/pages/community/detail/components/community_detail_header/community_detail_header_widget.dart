import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_counts_row/community_counts_row_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/components/community/community_tags/community_tags_widget.dart';
import '/components/community_detail_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_detail_header_model.dart';
export 'community_detail_header_model.dart';

class CommunityDetailHeaderWidget extends StatefulWidget {
  const CommunityDetailHeaderWidget({
    super.key,
    required this.community,
    bool? isInvited,
  }) : this.isInvited = isInvited ?? false;

  final CommunityWithImageRow? community;
  final bool isInvited;

  @override
  State<CommunityDetailHeaderWidget> createState() =>
      _CommunityDetailHeaderWidgetState();
}

class _CommunityDetailHeaderWidgetState
    extends State<CommunityDetailHeaderWidget> {
  late CommunityDetailHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityDetailHeaderModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: SupabaseDBGroup.getCommunityInfoCall.call(
        pUserId: FFAppState().userInfo.id,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final containerGetCommunityInfoResponse = snapshot.data!;

        return Container(
          height: 414.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 196.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget.community!.imageUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: wrapWithModel(
                        model: _model.communityFriendsMetaRowModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CommunityFriendsMetaRowWidget(
                          communityId: widget.community!.id!,
                          friendList: (getJsonField(
                            containerGetCommunityInfoResponse.jsonBody,
                            r'''$["friend_user_ids"]''',
                            true,
                          ) as List?)
                              ?.cast<int>(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: Color(0x65292929),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.communityBookmarkButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: CommunityBookmarkButtonWidget(
                                    userId: FFAppState().userInfo.id,
                                    community: widget.community!.id!,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.communityBottomSheetButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CommunityBottomSheetButtonWidget(
                                    community: widget.community!.id!,
                                    userId: FFAppState().userInfo.id,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.community?.name,
                                        '推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場推し商品語り場',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  wrapWithModel(
                                    model: _model.communityCountsRowModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CommunityCountsRowWidget(
                                      community: widget.community!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.communityDetailButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CommunityDetailButtonWidget(
                                      communityId: widget.community?.id,
                                      creatorId: widget.community!.creatorId!,
                                      privacyType:
                                          widget.community!.privacyType!,
                                      communityName: widget.community!.name!,
                                      isInvited: widget.isInvited,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.community?.description,
                                        '日々のごはん作りをもっと楽しく。冷蔵庫の中にあるもので作れるレシピや、時短・節約メニューなど、気軽にアイデアを交換できるコミュニティです。みなさん一緒に語り合いましょう！日々のごはん作りをもっと楽しく。冷蔵庫の中にあるもので作れるレシピや、時短・節約メニューなど、気軽にアイデアを交換できるコミュニティです。みなさん一緒に語り合いましょう！',
                                      ).maybeHandleOverflow(
                                        maxChars: valueOrDefault<int>(
                                          _model.showAll! ? 1000 : 64,
                                          64,
                                        ),
                                        replacement: '…',
                                      ),
                                      maxLines: _model.showAll! ? 100 : 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.notoSansJp(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (functions.getStringLength(
                                              widget.community?.description) <
                                          64) {
                                        return Container(
                                          width: 0.0,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        );
                                      } else if (_model.showAll ?? false) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.showAll = false;
                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              '閉じる',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.notoSansJp(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.showAll = true;
                                            safeSetState(() {});
                                          },
                                          child: Text(
                                            'さらに見る',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.notoSansJp(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.communityTagsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CommunityTagsWidget(
                                categories: widget.community!.categories,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
