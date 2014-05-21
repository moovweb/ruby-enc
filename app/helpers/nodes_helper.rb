module NodesHelper
  def node_report_time(time)
    if time
      time_ago_in_words(time) + " ago"
    else
      "unreported"
    end
  end

  def puppet_agent_status(node)
    status = @puppet_agent.status[node.name]

    case status
      when "idling"
        content_tag(:span, status, :class => 'label label-default')
      when "running"
        content_tag(:span, status, :class => 'label label-warning')
      else
        content_tag(:span, "offline", :class => 'label label-danger')
    end
  end

  def node_status_badge(node)
    if node.status
      case node.status
        when "changed"
          content_tag(:span, node.status, :class => 'label label-info')
        when "pending"
          content_tag(:span, node.status, :class => 'label label-warning')
        when "unchanged"
          content_tag(:span, node.status, :class => 'label label-success')
        when "failed"
          content_tag(:span, node.status, :class => 'label label-danger')
      end
    else
      content_tag(:span, "unreported", :class => 'label label-default')
    end
  end
end
