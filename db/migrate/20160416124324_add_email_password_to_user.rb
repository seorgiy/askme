# (c) goodprogrammer.ru

# Миграция, созданная rails генератором.
#
# rails g migration AddEmailPasswordToUser email:string \
#   password_hash:string password_salt:string
#
class AddEmailPasswordToUser < ActiveRecord::Migration
  def change
    # Команды, добавляющие к таблице users поля email, password_hash,
    # password_salt (последние два нужны для аутентификации)
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string

    # Вручную добавленная команда — хотим еще хранить в юзере путь к его
    # аватарке.
    add_column :users, :avatar_url, :string
  end
end
