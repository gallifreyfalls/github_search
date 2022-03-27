module SearchHelper
  def link_to_prev_page(object, text, query)
    return if object[:total_pages].blank?
    return if object[:total_pages].zero?
    return unless object[:page]
    return if object[:page] == 1

    link_to(text,
            root_path(page: object[:page].to_i - 1, q: query),
            { class: 'btn btn-primary' })
  end

  def link_to_next_page(object, text, query)
    return if object[:total_pages].blank?
    return if object[:total_pages].zero?
    return unless object[:page]
    return if object[:page] == object[:total_pages]

    link_to(text,
            root_path(page: object[:page].to_i + 1, q: query),
            { class: 'btn btn-primary' })
  end
end
