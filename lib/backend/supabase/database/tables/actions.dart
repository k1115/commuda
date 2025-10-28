import '../database.dart';

class ActionsTable extends SupabaseTable<ActionsRow> {
  @override
  String get tableName => 'actions';

  @override
  ActionsRow createRow(Map<String, dynamic> data) => ActionsRow(data);
}

class ActionsRow extends SupabaseDataRow {
  ActionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get badgeId => getField<int>('badge_id')!;
  set badgeId(int value) => setField<int>('badge_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int get increasement => getField<int>('increasement')!;
  set increasement(int value) => setField<int>('increasement', value);

  List<int> get levels => getListField<int>('levels');
  set levels(List<int> value) => setListField<int>('levels', value);

  bool get isDisplay => getField<bool>('is_display')!;
  set isDisplay(bool value) => setField<bool>('is_display', value);
}
