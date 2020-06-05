module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def make_declension(amount, word_declensions)
    return word_declensions[2] if (11..14).include?(amount % 100)

    case amount % 10
    when 1 then word_declensions[0]
    when 2..4 then word_declensions[1]
    else word_declensions[2]
    end
  end

  def humanized_questions_amount(questions)
    return '' if questions.empty?

    "уже получил #{@questions.size} #{make_declension(@questions.size, %w[вопрос вопроса вопросов])}"
  end
end
