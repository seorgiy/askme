class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
     # Болванка пользователя
     @user = User.new(
      name: 'Vadim',
      username: 'installero',
      avatar_url: 'https://secure.gravatar.com/avatar/' \
        '71269686e0f757ddb4f73614f43ae445?s=100'
    )

    # Болванка вопросов для пользователя
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(
        text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2016')
      )
    ]

    # Болванка для нового вопроса
    @new_question = Question.new

    # Обратите внимание, пока ни одна из болванок не достается из базы
  end
end
