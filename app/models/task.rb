class Task < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true

  belongs_to :user

 # csvのバリデーション
  def self.csv_attributes
    ["name","body","created_at","end_date"]
  end

 # csvファイルのエクスポート
 def self.generate_csv
     CSV.generate(headers: true) do |csv|
       csv << csv_attributes
       all.each do |task|
         csv << csv_attributes.map{|attr| task.send(attr)}
       end
     end
   end

# csvファイルのインポート
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      task = new
      task.attributes = row.to_hash.slice(*csv_attributes)

      task.save!
    end
  end

# # インクリメンタルサーチ
#   def self.search(search)
#     if search
#       Task.where(['name LIKE ? ', "%#{search}%"])
#     else
#       current_user.tasks
#     end
#   end


end
