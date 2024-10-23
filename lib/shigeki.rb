class Shigeki
  attr_accessor :controller_name

  def initialize(controller_name)
    @controller_name = controller_name
  end

  def data(&)
    builder = Builder.new(controller_name)

    builder.instance_eval(&)

    builder.to_h
  end

  class Builder
    attr_accessor :controller_name

    def initialize(controller_name)
      @controller_name = controller_name
      @data = {}
    end

    def to_h
      @data
    end

    def controller
      @data = @data.deep_merge(controller: controller_name)

      self
    end

    # Define short hand methods for common events
    %i[
      ajax
      change
      click
      show
      submit
      success
    ].each do |event|
      define_method(:"action_#{event}") do |method|
        action(method:, event:)
      end
    end

    def action(method:, event: nil)
      action_data = "#{controller_name}##{method}"
      action_data = "#{event}->#{action_data}" if event.present?

      @data = @data.deep_merge(action: action_data)

      self
    end

    def target(name)
      target_key = "#{controller_name_underscored}_target"

      @data = @data.deep_merge(target_key => name)

      self
    end

    def value(name:, content:)
      target_key = "#{controller_name_underscored}_#{name}_value"

      @data = @data.deep_merge(target_key => content)

      self
    end

    def other(hash)
      @data = @data.deep_merge(hash)

      self
    end

    def controller_name_underscored
      controller_name.tr '-', '_'
    end
  end
end
