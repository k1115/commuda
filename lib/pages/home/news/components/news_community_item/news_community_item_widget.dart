import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/news/components/news_community_bar/news_community_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news_community_item_model.dart';
export 'news_community_item_model.dart';

class NewsCommunityItemWidget extends StatefulWidget {
  const NewsCommunityItemWidget({
    super.key,
    required this.communityAnnouncements,
  });

  final CommunityAnnouncementsViewRow? communityAnnouncements;

  @override
  State<NewsCommunityItemWidget> createState() =>
      _NewsCommunityItemWidgetState();
}

class _NewsCommunityItemWidgetState extends State<NewsCommunityItemWidget> {
  late NewsCommunityItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsCommunityItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await CommunityAnnouncementsTable().update(
        data: {
          'is_read': true,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          widget.communityAnnouncements?.id,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.threadOutput = await CommunityThreadDetailsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.communityAnnouncements?.threadId,
          ),
        );

        context.goNamed(
          CommunityThreadDetailWidget.routeName,
          queryParameters: {
            'thread': serializeParam(
              _model.threadOutput?.firstOrNull,
              ParamType.SupabaseRow,
            ),
            'previousPath': serializeParam(
              'News',
              ParamType.String,
            ),
          }.withoutNulls,
        );

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: FlutterFlowTheme.of(context).gray10,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.newsCommunityBarModel,
                updateCallback: () => safeSetState(() {}),
                child: NewsCommunityBarWidget(
                  communityTitle:
                      widget.communityAnnouncements!.communityName!,
                  isRead: widget.communityAnnouncements!.isRead!,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Builder(
                          builder: (context) {
                            if (widget.communityAnnouncements?.type == 1) {
                              return Container(
                                width: 40.0,
                                height: 40.0,
                                child: Stack(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (widget.communityAnnouncements
                                                    ?.profileImage !=
                                                null &&
                                            widget.communityAnnouncements
                                                    ?.profileImage !=
                                                '') {
                                          return Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              widget.communityAnnouncements!
                                                  .profileImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/image-profile.png',
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray100,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (widget.communityAnnouncements
                                                    ?.reactionType ==
                                                0) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/ic-reaction0.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            } else if (widget
                                                    .communityAnnouncements
                                                    ?.reactionType ==
                                                1) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/ic-reaction1.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            } else if (widget
                                                    .communityAnnouncements
                                                    ?.reactionType ==
                                                2) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/ic-reaction2.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 2.0, 2.0, 2.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/ic-reaction3.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  if (widget.communityAnnouncements
                                              ?.profileImage !=
                                          null &&
                                      widget.communityAnnouncements
                                              ?.profileImage !=
                                          '') {
                                    return Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        widget.communityAnnouncements!
                                            .profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/image-profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.communityAnnouncements?.userName,
                                  'りくママ@子育て中さん',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    functions.getGoneTime(widget
                                        .communityAnnouncements?.createdAt),
                                    '30分前',
                                  )} あなたのスレッドに${widget.communityAnnouncements?.type == 0 ? 'コメント' : 'リアクション'}しました',
                                  '30分前 あなたのスレッドにコメントしました',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    if (widget.communityAnnouncements?.commentContent !=
                            null &&
                        widget.communityAnnouncements?.commentContent != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.communityAnnouncements?.commentContent,
                            '参加希望者が参加申請を送った後、運営者がその内容を確認し、参加を「承認」して初めてメンバーになれる参加方式のことです。',
                          ),
                          maxLines: 3,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.notoSansJp(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.communityAnnouncements?.threadContent,
                              '〇〇の素や〇〇ドレッシングを使った野菜嫌いレシピを教えてください！※来月の企業のブログに記載しても良い方でお願いします。',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).gray100,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
