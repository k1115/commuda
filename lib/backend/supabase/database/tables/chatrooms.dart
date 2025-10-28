import '../database.dart';

class ChatroomsTable extends SupabaseTable<ChatroomsRow> {
  @override
  String get tableName => 'chatrooms';

  @override
  ChatroomsRow createRow(Map<String, dynamic> data) => ChatroomsRow(data);
}

class ChatroomsRow extends SupabaseDataRow {
  ChatroomsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatroomsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  int get targetId => getField<int>('target_id')!;
  set targetId(int value) => setField<int>('target_id', value);
}
