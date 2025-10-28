import '../database.dart';

class CommunityReportsTable extends SupabaseTable<CommunityReportsRow> {
  @override
  String get tableName => 'community_reports';

  @override
  CommunityReportsRow createRow(Map<String, dynamic> data) =>
      CommunityReportsRow(data);
}

class CommunityReportsRow extends SupabaseDataRow {
  CommunityReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  List<String> get reasons => getListField<String>('reasons');
  set reasons(List<String>? value) => setListField<String>('reasons', value);

  String? get detail => getField<String>('detail');
  set detail(String? value) => setField<String>('detail', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
