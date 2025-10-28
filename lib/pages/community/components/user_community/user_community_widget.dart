import '/backend/supabase/supabase.dart';
import '/components/community/community_bookmark_button/community_bookmark_button_widget.dart';
import '/components/community/community_bottom_sheet_button/community_bottom_sheet_button_widget.dart';
import '/components/community/community_friends_meta_row/community_friends_meta_row_widget.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/bottom_sheets/thread_more_action_bottom_sheet/thread_more_action_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'user_community_model.dart';
export 'user_community_model.dart';

class UserCommunityWidget extends StatefulWidget {
  const UserCommunityWidget({
    super.key,
    this.community,
  });

  final CommunityWithImageRow? community;

  @override
  State<UserCommunityWidget> createState() => _UserCommunityWidgetState();
}

class _UserCommunityWidgetState extends State<UserCommunityWidget> {
  late UserCommunityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCommunityModel());

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
        );

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.community?.creatorId == FFAppState().userInfo.id)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).SuccessLight,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                      child: Text(
                        'あなたがオーナーのコミュニティ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.notoSansJp(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).success,
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
              Container(
                width: double.infinity,
                height: 152.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          if (widget.community?.imageUrl != null &&
                              widget.community?.imageUrl != '') {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: OctoImage(
                                placeholderBuilder: (_) => SizedBox.expand(
                                  child: Image(
                                    image: BlurHashImage('BLURHASHSTRING'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                image: CachedNetworkImageProvider(
                                  widget.community!.imageUrl!,
                                ),
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
                                userId: FFAppState().userInfo.id,
                                community: widget.community!.id!,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.communityBottomSheetButtonModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CommunityBottomSheetButtonWidget(
                                userId: FFAppState().userInfo.id,
                                community: widget.community!.id!,
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: wrapWithModel(
                        model: _model.communityFriendsMetaRowModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CommunityFriendsMetaRowWidget(
                          communityId: FFAppState().userInfo.id,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.community?.name,
                    '推し商品語り場',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.notoSansJp(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              FutureBuilder<List<CommunityThreadDetailsRow>>(
                future: CommunityThreadDetailsTable().querySingleRow(
                  queryFn: (q) => q
                      .eqOrNull(
                        'community_id',
                        widget.community?.id,
                      )
                      .order('created_at'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return EmptyLoadingWidget();
                  }
                  List<CommunityThreadDetailsRow>
                      containerCommunityThreadDetailsRowList = snapshot.data!;

                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerCommunityThreadDetailsRow =
                      containerCommunityThreadDetailsRowList.isNotEmpty
                          ? containerCommunityThreadDetailsRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '最新スレッド',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.notoSansJp(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).gray100,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 2.0,
                                    height: 83.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).gray40,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (containerCommunityThreadDetailsRow
                                                                ?.profileImage !=
                                                            null &&
                                                        containerCommunityThreadDetailsRow
                                                                ?.profileImage !=
                                                            '') {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        child: Image.network(
                                                          containerCommunityThreadDetailsRow!
                                                              .profileImage!,
                                                          width: 34.0,
                                                          height: 34.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        child: Image.asset(
                                                          'assets/images/image-profile.png',
                                                          width: 34.0,
                                                          height: 34.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        containerCommunityThreadDetailsRow
                                                            ?.nickName,
                                                        '未設定',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.getGoneTime(
                                                                containerCommunityThreadDetailsRow
                                                                    ?.createdAt),
                                                            '30分前',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray100,
                                                                fontSize: 12.0,
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
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 2.0)),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          ThreadMoreActionBottomSheetWidget(
                                                        thread:
                                                            containerCommunityThreadDetailsRow!,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/ic-more_vert-color.svg',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              containerCommunityThreadDetailsRow
                                                  ?.content,
                                              'うちはキッズが「コーン入りドレッシング」で作ったシチューが大好きで、野菜嫌いでもモリモリ食べます！',
                                            ),
                                            maxLines: 2,
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
                                                      .gray100,
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
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
