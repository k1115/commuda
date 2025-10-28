import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home/news/components/news_community_bar/news_community_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_friendtem_model.dart';
export 'news_friendtem_model.dart';

class NewsFriendtemWidget extends StatefulWidget {
  const NewsFriendtemWidget({
    super.key,
    required this.friendRequest,
  });

  final FriendRequestsViewRow? friendRequest;

  @override
  State<NewsFriendtemWidget> createState() => _NewsFriendtemWidgetState();
}

class _NewsFriendtemWidgetState extends State<NewsFriendtemWidget> {
  late NewsFriendtemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsFriendtemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      await FriendRequestsTable().update(
        data: {
          'is_read': true,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          widget.friendRequest?.id,
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                wrapWithModel(
                  model: _model.newsCommunityBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NewsCommunityBarWidget(
                    communityTitle: widget.friendRequest!.communityName!,
                    isRead: widget.friendRequest!.isRead!,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.userOutput =
                                    await UserWithProfileTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    widget.friendRequest?.userId,
                                  ),
                                );

                                context.pushNamed(
                                  UserWidget.routeName,
                                  queryParameters: {
                                    'targetUser': serializeParam(
                                      _model.userOutput?.firstOrNull,
                                      ParamType.SupabaseRow,
                                    ),
                                    'currentUserId': serializeParam(
                                      FFAppState().userInfo.id,
                                      ParamType.int,
                                    ),
                                    'communityId': serializeParam(
                                      widget.friendRequest?.communityId,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (widget.friendRequest
                                                    ?.profileImage !=
                                                null &&
                                            widget.friendRequest
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
                                              widget
                                                  .friendRequest!.profileImage!,
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
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.friendRequest?.nickName,
                                          '未設定',
                                        ),
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
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getGoneTime(
                                              widget.friendRequest?.createdAt),
                                          '30分前',
                                        ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                                    ],
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (widget.friendRequest?.status == 0) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: _model.disableButton
                                            ? null
                                            : () async {
                                                _model.disableButton = true;
                                                safeSetState(() {});
                                                await FriendRequestsTable()
                                                    .update(
                                                  data: {
                                                    'status': 1,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.friendRequest?.id,
                                                  ),
                                                );
                                                await FriendsTable().insert({
                                                  'user_id': widget
                                                      .friendRequest?.targetId,
                                                  'friend_id': widget
                                                      .friendRequest?.userId,
                                                });
                                                await FriendsTable().insert({
                                                  'user_id': widget
                                                      .friendRequest?.userId,
                                                  'friend_id': widget
                                                      .friendRequest?.targetId,
                                                });
                                                _model.overviewOutput =
                                                    await ChatroomOverviewTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .containsOrNull(
                                                        'user_ids',
                                                        '{${widget.friendRequest?.targetId}}',
                                                      )
                                                      .containsOrNull(
                                                        'user_ids',
                                                        '{${widget.friendRequest?.userId}}',
                                                      ),
                                                );
                                                if (!(_model.overviewOutput !=
                                                        null &&
                                                    (_model.overviewOutput)!
                                                        .isNotEmpty)) {
                                                  _model.chatroomOutput =
                                                      await ChatroomsTable()
                                                          .insert({
                                                    'creator_id': widget
                                                        .friendRequest
                                                        ?.targetId,
                                                    'target_id': widget
                                                        .friendRequest?.userId,
                                                  });
                                                }
                                                _model.disableButton = false;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                        text: '承認',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.notoSansJp(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                      FFButtonWidget(
                                        onPressed: _model.disableButton
                                            ? null
                                            : () async {
                                                _model.disableButton = true;
                                                safeSetState(() {});
                                                await FriendRequestsTable()
                                                    .update(
                                                  data: {
                                                    'status': 2,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.friendRequest?.id,
                                                  ),
                                                );
                                                _model.disableButton = false;
                                                safeSetState(() {});
                                                _model.updatePage(() {});
                                              },
                                        text: '拒否',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.notoSansJp(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray100,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  );
                                } else if (widget.friendRequest?.status == 1) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '承認しました',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                                    ],
                                  );
                                } else {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '拒否しました',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray100,
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
                                    ],
                                  );
                                }
                              },
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              48.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                                  widget.friendRequest?.content,
                                  '以前イベントでお会いしたあおいです！招待ありがとうございます。　',
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
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
          Divider(
            height: 2.0,
            thickness: 2.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ],
      ),
    );
  }
}
