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
end
