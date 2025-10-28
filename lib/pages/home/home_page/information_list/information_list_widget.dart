import '/backend/supabase/supabase.dart';
import '/components/empty_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/home/components/home_column_title/home_column_title_widget.dart';
import '/pages/home/components/home_info_item/home_info_item_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'information_list_model.dart';
export 'information_list_model.dart';

class InformationListWidget extends StatefulWidget {
  const InformationListWidget({super.key});

  @override
  State<InformationListWidget> createState() => _InformationListWidgetState();
}

class _InformationListWidgetState extends State<InformationListWidget> {
  late InformationListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InformationsRow>>(
      stream: _model.informationSupabaseStream ??= SupaFlow.client
          .from("informations")
          .stream(primaryKey: ['id'])
          .order('sent_at')
          .limit(2)
          .map((list) => list.map((item) => InformationsRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return EmptyLoadingWidget();
        }
        List<InformationsRow> informationInformationsRowList = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(InformationWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.homeColumnTitleModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HomeColumnTitleWidget(
                      title: 'インフォメーション',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final informationVar =
                          informationInformationsRowList.toList();

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(informationVar.length,
                            (informationVarIndex) {
                          final informationVarItem =
                              informationVar[informationVarIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(
                                InformationDetailWidget.routeName,
                                queryParameters: {
                                  'informationId': serializeParam(
                                    informationVarItem.id,
                                    ParamType.int,
                                  ),
                                  'previousPath': serializeParam(
                                    'Home',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model: _model.homeInfoItemModels.getModel(
                                informationVarItem.id.toString(),
                                informationVarIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: HomeInfoItemWidget(
                                key: Key(
                                  'Keyufb_${informationVarItem.id.toString()}',
                                ),
                                information: informationVarItem,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        );
      },
    );
  }
}
