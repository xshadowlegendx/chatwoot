class WidgetTestsController < ActionController::Base
  before_action :ensure_dark_mode
  before_action :ensure_loading_type
  before_action :ensure_web_widget
  before_action :ensure_widget_position
  before_action :ensure_widget_style
  before_action :ensure_widget_type

  def index
    render
  end

  private

  def ensure_widget_style
    @widget_style = params[:widget_style] || 'standard'
  end

  def ensure_dark_mode
    @dark_mode = params[:dark_mode] || 'light'
  end

  def ensure_loading_type
    @loading_type = params[:loading_type] || 'immediate'
  end

  def ensure_widget_position
    @widget_position = params[:position] || 'left'
  end

  def ensure_widget_type
    @widget_type = params[:type] || 'expanded_bubble'
  end

  def inbox_id
    @inbox_id ||= params[:inbox_id] || Channel::WebWidget.first.inbox.id
  end

  def ensure_web_widget
    @inbox = Inbox.find(inbox_id)
    @web_widget = @inbox.channel
  end
end
