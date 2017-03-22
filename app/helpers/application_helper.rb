module ApplicationHelper
  def group
    case current_account.group
      when '0'
        'Непроверенный'
      when '1'
        'Игрок'
      when '2'
        'Помощник'
      when '3'
        'Строитель'
      when '4'
        'Модератор'
      when '5'
        'Администратор'
      else
        'Неизвестный'
    end
  end
  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'mdl-textfield__error' do
        model.errors[attribute].join(", ")
      end
    end
  end
end
