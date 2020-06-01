# (c) goodprogrammer.ru

# Миграция, создающая сущность (таблицу) пользователя в базе.
class CreateUsers < ActiveRecord::Migration
  def change
    # Создает таблицу "users"
    create_table :users do |t|
      # Со строковыми полями name, username
      t.string :name
      t.string :username

      # И created_at (время создания записи), updated_at (время последнего
      # обновления записи).
      t.timestamps null: false
    end
  end
end
