import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/mypage/badge_list_item/badge_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_badge_model.dart';
export 'icon_badge_model.dart';

class IconBadgeWidget extends StatefulWidget {
  const IconBadgeWidget({
    super.key,
    required this.profile,
  });

  final ProfileRow? profile;

  static String routeName = 'IconBadge';
  static String routePath = '/iconBadge';

  @override
  State<IconBadgeWidget> createState() => _IconBadgeWidgetState();
}

class _IconBadgeWidgetState extends State<IconBadgeWidget> {
  late IconBadgeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconBadgeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.profile?.iconBadge != null) {
        _model.selectedBageId = widget.profile?.iconBadge;
        _model.initialBdageId = widget.profile?.iconBadge;
        safeSetState(() {});
      }
    });

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).gray10,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/ic-back.svg',
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'アイコンに表示するバッジを選択',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                      child: Container(
                        width: 96.0,
                        height: 96.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (widget.profile?.profileImage != null &&
                                      widget.profile?.profileImage != '') {
                                    return Container(
                                      width: 96.0,
                                      height: 96.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        widget.profile!.profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: 96.0,
                                      height: 96.0,
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
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.selectedBageId != null) {
                                    return FutureBuilder<List<BadgesRow>>(
                                      future: BadgesTable().querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          _model.selectedBageId,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BadgesRow> containerBadgesRowList =
                                            snapshot.data!;

                                        final containerBadgesRow =
                                            containerBadgesRowList.isNotEmpty
                                                ? containerBadgesRowList.first
                                                : null;

                                        return Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 24.0,
                                              height: 24.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                containerBadgesRow!.iconUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
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
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.selectedBageId = null;
                      safeSetState(() {});
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: FutureBuilder<List<UserBadgesRow>>(
                              future: UserBadgesTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'user_id',
                                      FFAppState().userInfo.id,
                                    )
                                    .order('badge_id', ascending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserBadgesRow> gridViewUserBadgesRowList =
                                    snapshot.data!;

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.8,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: gridViewUserBadgesRowList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewUserBadgesRow =
                                        gridViewUserBadgesRowList[
                                            gridViewIndex];
                                    return FutureBuilder<List<BadgesRow>>(
                                      future: BadgesTable().querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          gridViewUserBadgesRow.badgeId,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BadgesRow>
                                            badgeListItemBadgesRowList =
                                            snapshot.data!;

                                        final badgeListItemBadgesRow =
                                            badgeListItemBadgesRowList
                                                    .isNotEmpty
                                                ? badgeListItemBadgesRowList
                                                    .first
                                                : null;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.selectedBageId ==
                                                badgeListItemBadgesRow.id) {
                                              _model.selectedBageId = null;
                                              safeSetState(() {});
                                            } else {
                                              _model.selectedBageId =
                                                  badgeListItemBadgesRow.id;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: wrapWithModel(
                                            model: _model.badgeListItemModels
                                                .getModel(
                                              badgeListItemBadgesRow!.id
                                                  .toString(),
                                              gridViewIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: BadgeListItemWidget(
                                              key: Key(
                                                'Keypb7_${badgeListItemBadgesRow.id.toString()}',
                                              ),
                                              badgeImage: badgeListItemBadgesRow
                                                  .iconUrl,
                                              badgeTitle:
                                                  badgeListItemBadgesRow.name,
                                              isActive:
                                                  badgeListItemBadgesRow.id ==
                                                      _model.selectedBageId,
                                              isInital:
                                                  badgeListItemBadgesRow.id ==
                                                      _model.initialBdageId,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 96.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.selectedBageId != null) {
                          await ProfileTable().update(
                            data: {
                              'icon_badge': _model.selectedBageId,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'user_id',
                              FFAppState().userInfo.id,
                            ),
                          );
                        } else {
                          await ProfileTable().update(
                            data: {
                              'icon_badge': null,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'user_id',
                              FFAppState().userInfo.id,
                            ),
                          );
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '成功しました。',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );
                        context.safePop();
                      },
                      text: '選択したバッジを表示する',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        hoverColor: FlutterFlowTheme.of(context).Main50,
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
