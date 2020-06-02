require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(タイトル 本文 登録日時 完了日時 )
  csv << csv_column_names
  @tasks.each do |tasks|
    column_values = [
      tasks.name,
      tasks.body,
      tasks.created_at.to_s(:datetime_jp),
      tasks.end_date
    ]
    csv << column_values
  end
end
