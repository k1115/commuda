import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_page_model.dart';
export 'invite_page_model.dart';

class InvitePageWidget extends StatefulWidget {
  const InvitePageWidget({
    super.key,
    required this.inviteCode,
  });

  final String? inviteCode;

  static String routeName = 'invitePage';
  static String routePath = '/invitePage';

  @override
  State<InvitePageWidget> createState() => _InvitePageWidgetState();
}

class _InvitePageWidgetState extends State<InvitePageWidget> {
  late InvitePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitePageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'コミュニティに招待されました。\nボタンを押してコミュニティページに遷移します。',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.notoSansJp(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).gray80,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.communityOutput =
                        await CommunityWithImageTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'invite_code',
                        widget.inviteCode,
                      ),
                    );
                    _model.communityMemberOutput =
                        await CommunityMembersTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'community_id',
                            _model.communityOutput?.firstOrNull?.id,
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

                    context.goNamed(
                      CommunityDetailWidget.routeName,
                      queryParameters: {
                        'community': serializeParam(
                          _model.communityOutput?.firstOrNull,
                          ParamType.SupabaseRow,
                        ),
                        'isShow': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                        'isInvite': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );

                    safeSetState(() {});
                  },
                  text: 'コミュニティに転移',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.notoSansJp(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
