module ApplicationHelper
  def new_subscription
    Subscription.new
  end

  def horizontal_image_rule(options = {})
    raw("<div class='horizontal-rule-img #{options[:class]}'>
      <img src='#{asset_path 'horizontal_rule.png'}' srcset='#{asset_path 'horizontal_rule.png'} 2x' />
    </div>")
  end

  def open_graph_tags(options = {})
    if options.present?
      options.merge!(default_open_graph_tags)
      content_for :open_graph_tags, render(partial: 'shared/open_graph', locals: { options: options })
    else
      if content_for?(:open_graph_tags)
        content_for :open_graph_tags
      else
        render(partial: 'shared/open_graph', locals: { options: default_open_graph_tags })
      end
    end
  end

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? content_for(:title) + " | #{t(:site_name)}" : t(:site_name)
    end
  end

  def asset_url(source)
    URI.join(root_url, asset_path(source))
  end

  private
  def default_open_graph_tags
    { :'site_name' => t(:site_name) }
  end
end
