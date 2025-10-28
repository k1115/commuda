import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/action/components/action_progress_list_item/action_progress_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'action_model.dart';
export 'action_model.dart';

class ActionWidget extends StatefulWidget {
  const ActionWidget({super.key});

  static String routeName = 'Action';
  static String routePath = '/action';

  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  late ActionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionModel());

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

    return StreamBuilder<List<UserActionProgressRow>>(
      stream: _model.actionSupabaseStream ??= SupaFlow.client
          .from("user_action_progress")
          .stream(primaryKey: ['user_id', 'action_id'])
          .eqOrNull(
            'user_id',
            FFAppState().userInfo.id,
          )
          .map((list) =>
              list.map((item) => UserActionProgressRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).gray10,
            body: EmptyLoadingWidget(),
          );
        }
        List<UserActionProgressRow> actionUserActionProgressRowList =
            snapshot.data!;

        return Scaffold(
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
                  context.pop();
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
                'アクション',
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
              titlePadding:
                  EdgeInsetsDirectional.fromSTEB(52.0, 0.0, 0.0, 18.0),
            ),
            elevation: 0.0,
          ),
          body: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final actionVar = actionUserActionProgressRowList.toList();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(actionVar.length, (actionVarIndex) {
                        final actionVarItem = actionVar[actionVarIndex];
                        return wrapWithModel(
                          model: _model.actionProgressListItemModels.getModel(
                            actionVarIndex.toString(),
                            actionVarIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: ActionProgressListItemWidget(
                            key: Key(
                              'Keyu1h_${actionVarIndex.toString()}',
                            ),
                            action: actionVarItem,
                          ),
                        );
                      }),
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
