module BannersHelper
  def status_label status
    status_span_generator status
  end

  private

    def status_span_generator status
      case status
        when 'submitted'
          content_tag(:span, status.titleize, class: 'label label-primary')
        when 'assigned'
          content_tag(:span, status.titleize, class: 'label label-info')
        when 'completed'
          content_tag(:span, status.titleize, class: 'label label-warning')
        when 'rejected'
          content_tag(:span, status.titleize, class: 'label label-danger')
        when 'approved'
          content_tag(:span, status.titleize, class: 'label label-success')
        end
    end
end
