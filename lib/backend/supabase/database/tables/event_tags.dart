import '../database.dart';

class EventTagsTable extends SupabaseTable<EventTagsRow> {
  @override
  String get tableName => 'event_tags';

  @override
  EventTagsRow createRow(Map<String, dynamic> data) => EventTagsRow(data);
}

class EventTagsRow extends SupabaseDataRow {
  EventTagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventTagsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
