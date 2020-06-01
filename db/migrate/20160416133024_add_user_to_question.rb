# (c) goodprogrammer.ru

# Миграция, созданная rails генератором:
#
# rails g migration AddUserToQuestion user:references
#
class AddUserToQuestion < ActiveRecord::Migration
  def change
    # Добавляет в таблицу questions поле user_id, ссылающееся на таблицу users
    add_reference :questions, :user, index: true, foreign_key: true
  end
end
