# (c) goodprogrammer.ru

# Миграция, создающая сущность (таблицу) вопроса в базе.
class CreateQuestions < ActiveRecord::Migration
  def change
    # Создает таблицу "questions"
    create_table :questions do |t|
      # со строковыми полями text, answer
      t.string :text
      t.string :answer

      # И created_at (время создания записи), updated_at (время последнего
      # обновления записи)
      t.timestamps null: false
    end
  end
end
