import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/community/components/user_community/user_community_widget.dart';
import '/pages/home/user/components/badge_item/badge_item_widget.dart';
import '/pages/home/user/components/friend_item/friend_item_widget.dart';
import '/pages/home/user/components/user_bottom_sheet/user_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
export 'user_model.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({
    super.key,
    required this.targetUser,
    required this.currentUserId,
    required this.communityId,
  });

  final UserWithProfileRow? targetUser;
  final int? currentUserId;
  final int? communityId;

  static String routeName = 'User';
  static String routePath = '/user';

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> with TickerProviderStateMixin {
  late UserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.currentUserId != widget.targetUser?.id) {
        await FootprintTable().insert({
          'user_id': widget.currentUserId,
          'target_id': widget.targetUser?.id,
          'community_id': widget.communityId,
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ProfileWithDetailRow>>(
      future:
          (_model.requestCompleter3 ??= Completer<List<ProfileWithDetailRow>>()
                ..complete(ProfileWithDetailTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'user_id',
                    widget.targetUser?.id,
                  ),
                )))
              .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: EmptyLoadingWidget(),
          );
        }
        List<ProfileWithDetailRow> userProfileWithDetailRowList =
            snapshot.data!;

        final userProfileWithDetailRow = userProfileWithDetailRowList.isNotEmpty
            ? userProfileWithDetailRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: false,
                  floating: false,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: FutureBuilder<List<FriendsRow>>(
                      future: FriendsTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'user_id',
                              widget.currentUserId,
                            )
                            .eqOrNull(
                              'friend_id',
                              widget.targetUser?.id,
                            ),
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
                        List<FriendsRow> containerFriendsRowList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (userProfileWithDetailRow
                                                    ?.coverImage !=
                                                null &&
                                            userProfileWithDetailRow
                                                    ?.coverImage !=
                                                '') {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              userProfileWithDetailRow!
                                                  .coverImage!,
                                              width: double.infinity,
                                              height: 125.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/image-cover.png',
                                              width: double.infinity,
                                              height: 125.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                color: Color(0x66000000),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.chevron_left_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          UserBottomSheetWidget(
                                                        currentUser: widget
                                                            .currentUserId!,
                                                        targetUser: widget
                                                            .targetUser!.id!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x66000000),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 4.0, 4.0, 4.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/ic-more_vert.svg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 80.0, 0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 40.0, 8.0, 8.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              widget.targetUser
                                                                  ?.nickName,
                                                              '未設定',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 10,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              if (widget
                                                                      .currentUserId !=
                                                                  widget
                                                                      .targetUser
                                                                      ?.id) {
                                                                return FutureBuilder<
                                                                    List<
                                                                        FriendRequestsRow>>(
                                                                  future: FriendRequestsTable()
                                                                      .queryRows(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'user_id',
                                                                      widget
                                                                          .currentUserId,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<FriendRequestsRow>
                                                                        friendContainerFriendRequestsRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (!(friendContainerFriendRequestsRowList
                                                                              .isNotEmpty)) {
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.blockUserIdsOutput = await BlockUsersTable().queryRows(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'block_user_id',
                                                                                    widget.currentUserId,
                                                                                  ),
                                                                                );
                                                                                if (!(_model.blockUserIdsOutput!.where((e) => e.userId == widget.targetUser?.id).toList().isNotEmpty)) {
                                                                                  await FriendRequestsTable().insert({
                                                                                    'user_id': widget.currentUserId,
                                                                                    'target_id': widget.targetUser?.id,
                                                                                    'content': '同じコミュニティに所属している${FFAppState().userInfo.name}です。よろしくお願いします！',
                                                                                    'status': 0,
                                                                                    'is_read': false,
                                                                                    'community_id': widget.communityId,
                                                                                  });
                                                                                  await NotificationsTable().insert({
                                                                                    'user_id': FFAppState().userInfo.id,
                                                                                    'target_id': widget.targetUser?.id,
                                                                                    'notification_flag': 1,
                                                                                  });
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'そのユーザーからブロックされました。',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).warning,
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: 'フレンド追加',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.notoSansJp(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            );
                                                                          } else if (friendContainerFriendRequestsRowList.firstOrNull?.status ==
                                                                              0) {
                                                                            return FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await FriendRequestsTable().delete(
                                                                                  matchingRows: (rows) => rows
                                                                                      .eqOrNull(
                                                                                        'user_id',
                                                                                        widget.currentUserId,
                                                                                      )
                                                                                      .eqOrNull(
                                                                                        'target_id',
                                                                                        widget.targetUser?.id,
                                                                                      )
                                                                                      .eqOrNull(
                                                                                        'community_id',
                                                                                        widget.communityId,
                                                                                      ),
                                                                                );
                                                                              },
                                                                              text: 'フレンド申請取り消し',
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.notoSansJp(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: MediaQuery.sizeOf(context).width < 370.0 ? 12.0 : 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).gray20,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                            );
                                                                          } else if (friendContainerFriendRequestsRowList.firstOrNull?.status ==
                                                                              1) {
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () {
                                                                                    print('Button pressed ...');
                                                                                  },
                                                                                  text: 'フレンド',
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.notoSansJp(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).gray20,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                  ),
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).gray20,
                                                                                  borderRadius: 30.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  icon: Icon(
                                                                                    Icons.mail_outline_rounded,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    _model.chatroomOverviewOutput = await ChatroomOverviewTable().queryRows(
                                                                                      queryFn: (q) => q
                                                                                          .containsOrNull(
                                                                                            'user_ids',
                                                                                            '{${widget.currentUserId}}',
                                                                                          )
                                                                                          .containsOrNull(
                                                                                            'user_ids',
                                                                                            '{${widget.targetUser?.id}}',
                                                                                          ),
                                                                                    );
                                                                                    if (_model.chatroomOverviewOutput != null && (_model.chatroomOverviewOutput)!.isNotEmpty) {
                                                                                      context.pushNamed(
                                                                                        MessageDetailWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'chatRoom': serializeParam(
                                                                                            _model.chatroomOverviewOutput?.firstOrNull,
                                                                                            ParamType.SupabaseRow,
                                                                                          ),
                                                                                          'targetUser': serializeParam(
                                                                                            widget.targetUser,
                                                                                            ParamType.SupabaseRow,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            );
                                                                          } else {
                                                                            return Container(
                                                                              width: 1.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else if (containerFriendsRowList
                                                                  .isNotEmpty) {
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text:
                                                                          'フレンド',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.notoSansJp(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).gray20,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .gray20,
                                                                      borderRadius:
                                                                          30.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .mail_outline_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        _model.chatroomOverviewOutput1 =
                                                                            await ChatroomOverviewTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .containsOrNull(
                                                                                'user_ids',
                                                                                '{${widget.currentUserId}}',
                                                                              )
                                                                              .containsOrNull(
                                                                                'user_ids',
                                                                                '{${widget.targetUser?.id}}',
                                                                              ),
                                                                        );
                                                                        if (_model.chatroomOverviewOutput1 !=
                                                                                null &&
                                                                            (_model.chatroomOverviewOutput1)!.isNotEmpty) {
                                                                          context
                                                                              .pushNamed(
                                                                            MessageDetailWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'chatRoom': serializeParam(
                                                                                _model.chatroomOverviewOutput1?.firstOrNull,
                                                                                ParamType.SupabaseRow,
                                                                              ),
                                                                              'targetUser': serializeParam(
                                                                                widget.targetUser,
                                                                                ParamType.SupabaseRow,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: 100.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          userProfileWithDetailRow
                                                              ?.description,
                                                          '未設定',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      FutureBuilder<
                                                          List<
                                                              FriendsProfileViewRow>>(
                                                        future:
                                                            FriendsProfileViewTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'user_id',
                                                            widget
                                                                .targetUser?.id,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<FriendsProfileViewRow>
                                                              containerFriendsProfileViewRowList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Visibility(
                                                              visible:
                                                                  containerFriendsProfileViewRowList
                                                                      .isNotEmpty,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/ic-diversity-2.svg',
                                                                          width:
                                                                              18.0,
                                                                          height:
                                                                              18.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final friends = containerFriendsProfileViewRowList.toList();

                                                                              return Stack(
                                                                                children: List.generate(friends.length, (friendsIndex) {
                                                                                  final friendsItem = friends[friendsIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                                        valueOrDefault<double>(
                                                                                          functions.getPaddingSize(friendsIndex)?.toDouble(),
                                                                                          0.0,
                                                                                        ),
                                                                                        0.0,
                                                                                        0.0,
                                                                                        0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).gray20,
                                                                                        ),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (friendsItem.friendProfileImage != null && friendsItem.friendProfileImage != '') {
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(24.0),
                                                                                              child: Image.network(
                                                                                                friendsItem.friendProfileImage!,
                                                                                                width: 26.0,
                                                                                                height: 26.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(24.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/image-profile.png',
                                                                                                width: 26.0,
                                                                                                height: 26.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            '計${containerFriendsProfileViewRowList.length.toString()}人',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.notoSansJp(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      FutureBuilder<
                                                          List<
                                                              FriendRequestsViewRow>>(
                                                        future:
                                                            FriendRequestsViewTable()
                                                                .querySingleRow(
                                                          queryFn: (q) => q
                                                              .eqOrNull(
                                                                'user_id',
                                                                widget
                                                                    .targetUser
                                                                    ?.id,
                                                              )
                                                              .eqOrNull(
                                                                'target_id',
                                                                widget
                                                                    .currentUserId,
                                                              )
                                                              .eqOrNull(
                                                                'status',
                                                                0,
                                                              ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<FriendRequestsViewRow>
                                                              containerFriendRequestsViewRowList =
                                                              snapshot.data!;

                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final containerFriendRequestsViewRow =
                                                              containerFriendRequestsViewRowList
                                                                      .isNotEmpty
                                                                  ? containerFriendRequestsViewRowList
                                                                      .first
                                                                  : null;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray20,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'フレンド申請',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.notoSansJp(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await FriendRequestsTable().update(
                                                                                data: {
                                                                                  'status': 1,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      widget.targetUser?.id,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'target_id',
                                                                                      FFAppState().userInfo.id,
                                                                                    ),
                                                                              );
                                                                              _model.friendOutput = await FriendsTable().queryRows(
                                                                                queryFn: (q) => q.eqOrNull(
                                                                                  'user_id',
                                                                                  widget.currentUserId,
                                                                                ),
                                                                              );
                                                                              if (!(_model.friendOutput != null && (_model.friendOutput)!.isNotEmpty)) {
                                                                                await FriendsTable().insert({
                                                                                  'user_id': widget.targetUser?.id,
                                                                                  'friend_id': widget.currentUserId,
                                                                                });
                                                                                await FriendsTable().insert({
                                                                                  'user_id': widget.currentUserId,
                                                                                  'friend_id': widget.targetUser?.id,
                                                                                });
                                                                              }
                                                                              _model.overviewOutput = await ChatroomOverviewTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .containsOrNull(
                                                                                      'user_ids',
                                                                                      '{${FFAppState().userInfo.id}}',
                                                                                    )
                                                                                    .containsOrNull(
                                                                                      'user_ids',
                                                                                      '{${userProfileWithDetailRow?.userId}}',
                                                                                    ),
                                                                              );
                                                                              if (!(_model.overviewOutput != null && (_model.overviewOutput)!.isNotEmpty)) {
                                                                                _model.chatroomOutput = await ChatroomsTable().insert({
                                                                                  'creator_id': FFAppState().userInfo.id,
                                                                                  'target_id': userProfileWithDetailRow?.userId,
                                                                                });
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                '承認',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await FriendRequestsTable().update(
                                                                                data: {
                                                                                  'status': 2,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      widget.targetUser?.id,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'target_id',
                                                                                      FFAppState().userInfo.id,
                                                                                    ),
                                                                              );
                                                                            },
                                                                            text:
                                                                                '拒否',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.notoSansJp(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).gray100,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray10,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerFriendRequestsViewRow
                                                                              ?.content,
                                                                          '同じコミュニティに所属しているayaです。よろしくお願いします！',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.notoSansJp(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 64.0,
                                              height: 64.0,
                                              child: Stack(
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (userProfileWithDetailRow
                                                                  ?.profileImage !=
                                                              null &&
                                                          userProfileWithDetailRow
                                                                  ?.profileImage !=
                                                              '') {
                                                        return Container(
                                                          width: 64.0,
                                                          height: 64.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      32.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          32.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      32.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      32.0),
                                                            ),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 64.0,
                                                            height: 64.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              userProfileWithDetailRow!
                                                                  .profileImage!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Container(
                                                          width: 64.0,
                                                          height: 64.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      48.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          48.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      48.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      48.0),
                                                            ),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 64.0,
                                                            height: 64.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/image-profile.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (userProfileWithDetailRow
                                                                    ?.iconBadgeUrl !=
                                                                null &&
                                                            userProfileWithDetailRow
                                                                    ?.iconBadgeUrl !=
                                                                '') {
                                                          return Container(
                                                            width: 28.0,
                                                            height: 28.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              userProfileWithDetailRow!
                                                                  .iconBadgeUrl!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              indicatorWeight: 3.0,
                              tabs: [
                                Tab(
                                  text: 'コミュニティ',
                                ),
                                Tab(
                                  text:
                                      'フレンド(${userProfileWithDetailRow?.friendCount?.toString()})',
                                ),
                                Tab(
                                  text:
                                      'バッジ(${userProfileWithDetailRow!.profileBadges.isNotEmpty ? userProfileWithDetailRow.profileBadges.length.toString() : '0'})',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                FutureBuilder<List<CommunityMembersRow>>(
                                  future: (_model.requestCompleter1 ??=
                                          Completer<List<CommunityMembersRow>>()
                                            ..complete(CommunityMembersTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'user_id',
                                                    widget.targetUser?.id,
                                                  )
                                                  .eqOrNull(
                                                    'participate_status',
                                                    1,
                                                  )
                                                  .order('created_at'),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return EmptyLoadingWidget();
                                    }
                                    List<CommunityMembersRow>
                                        myCommunitiesCommunityMembersRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).gray10,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final containerVar =
                                                myCommunitiesCommunityMembersRowList
                                                    .toList();
                                            if (containerVar.isEmpty) {
                                              return EmptyListWidget(
                                                text: 'コミュニティの情報がありません',
                                              );
                                            }

                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                safeSetState(() => _model
                                                    .requestCompleter1 = null);
                                                await _model
                                                    .waitForRequestCompleted1();
                                              },
                                              child: SingleChildScrollView(
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      containerVar.length,
                                                      (containerVarIndex) {
                                                    final containerVarItem =
                                                        containerVar[
                                                            containerVarIndex];
                                                    return FutureBuilder<
                                                        List<
                                                            CommunityWithImageRow>>(
                                                      future:
                                                          CommunityWithImageTable()
                                                              .querySingleRow(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'id',
                                                          containerVarItem
                                                              .communityId,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return EmptyLoadingWidget();
                                                        }
                                                        List<CommunityWithImageRow>
                                                            userCommunityCommunityWithImageRowList =
                                                            snapshot.data!;

                                                        final userCommunityCommunityWithImageRow =
                                                            userCommunityCommunityWithImageRowList
                                                                    .isNotEmpty
                                                                ? userCommunityCommunityWithImageRowList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .userCommunityModels
                                                              .getModel(
                                                            containerVarItem.id
                                                                .toString(),
                                                            containerVarIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              UserCommunityWidget(
                                                            key: Key(
                                                              'Keygln_${containerVarItem.id.toString()}',
                                                            ),
                                                            community:
                                                                userCommunityCommunityWithImageRow,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                FutureBuilder<List<FriendsProfileViewRow>>(
                                  future:
                                      (_model.requestCompleter2 ??= Completer<
                                              List<FriendsProfileViewRow>>()
                                            ..complete(FriendsProfileViewTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'user_id',
                                                    FFAppState().userInfo.id,
                                                  )
                                                  .ilike(
                                                    'friend_nick_name',
                                                    '%${_model.textController.text}%',
                                                  ),
                                            )))
                                          .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return EmptyLoadingWidget();
                                    }
                                    List<FriendsProfileViewRow>
                                        userFriendContainerFriendsProfileViewRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).gray10,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (userFriendContainerFriendsProfileViewRowList
                                                .isNotEmpty)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 16.0, 8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction
                                                              .search,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText: 'メンバーを検索',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .notoSansJp(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        prefixIcon: Icon(
                                                          Icons.search,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final filteredUser =
                                                        userFriendContainerFriendsProfileViewRowList
                                                            .toList();
                                                    if (filteredUser.isEmpty) {
                                                      return EmptyListWidget(
                                                        text: 'フレンドの情報がありません',
                                                      );
                                                    }

                                                    return RefreshIndicator(
                                                      onRefresh: () async {
                                                        safeSetState(() => _model
                                                                .requestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted2();
                                                      },
                                                      child: ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            filteredUser.length,
                                                        itemBuilder: (context,
                                                            filteredUserIndex) {
                                                          final filteredUserItem =
                                                              filteredUser[
                                                                  filteredUserIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .friendItemModels
                                                                .getModel(
                                                              filteredUserIndex
                                                                  .toString(),
                                                              filteredUserIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                FriendItemWidget(
                                                              key: Key(
                                                                'Keywte_${filteredUserIndex.toString()}',
                                                              ),
                                                              friend:
                                                                  filteredUserItem,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).gray10,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final bdages = userProfileWithDetailRow
                                                .profileBadges
                                                .toList() ??
                                            [];
                                        if (bdages.isEmpty) {
                                          return EmptyListWidget(
                                            text: 'バッジの情報がありません',
                                          );
                                        }

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .requestCompleter3 = null);
                                            await _model
                                                .waitForRequestCompleted3();
                                          },
                                          child: GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 2.0,
                                              mainAxisSpacing: 2.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: bdages.length,
                                            itemBuilder:
                                                (context, bdagesIndex) {
                                              final bdagesItem =
                                                  bdages[bdagesIndex];
                                              return wrapWithModel(
                                                model: _model.badgeItemModels
                                                    .getModel(
                                                  bdagesIndex.toString(),
                                                  bdagesIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: BadgeItemWidget(
                                                  key: Key(
                                                    'Keyybe_${bdagesIndex.toString()}',
                                                  ),
                                                  badgeID: bdagesItem,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
