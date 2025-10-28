import '../database.dart';

class CommunitiesTable extends SupabaseTable<CommunitiesRow> {
  @override
  String get tableName => 'communities';

  @override
  CommunitiesRow createRow(Map<String, dynamic> data) => CommunitiesRow(data);
}

class CommunitiesRow extends SupabaseDataRow {
  CommunitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String get rules => getField<String>('rules')!;
  set rules(String value) => setField<String>('rules', value);

  int get privacyType => getField<int>('privacy_type')!;
  set privacyType(int value) => setField<int>('privacy_type', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get inviteCode => getField<String>('invite_code');
  set inviteCode(String? value) => setField<String>('invite_code', value);
}
