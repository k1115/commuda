import '../database.dart';

class PoliciesTable extends SupabaseTable<PoliciesRow> {
  @override
  String get tableName => 'policies';

  @override
  PoliciesRow createRow(Map<String, dynamic> data) => PoliciesRow(data);
}

class PoliciesRow extends SupabaseDataRow {
  PoliciesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PoliciesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get policyName => getField<String>('policy_name')!;
  set policyName(String value) => setField<String>('policy_name', value);

  String get version => getField<String>('version')!;
  set version(String value) => setField<String>('version', value);

  String? get changeSummary => getField<String>('change_summary');
  set changeSummary(String? value) => setField<String>('change_summary', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  int? get publisher => getField<int>('publisher');
  set publisher(int? value) => setField<int>('publisher', value);

  DateTime get publishedAt => getField<DateTime>('published_at')!;
  set publishedAt(DateTime value) => setField<DateTime>('published_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
