class Shigeki
  attr_accessor :controller_name

  def initialize(controller_name)
    @controller_name = controller_name
  end

  def call(target: nil, action: nil, options: {})
    return if target.nil? && action.nil?

    {
      data: {
        "#{underscored}_target": target,
        action: ("#{controller_name}##{action}" if action.present?)
      }
    }.compact.deep_merge(options)
  end

  def underscored
    controller_name.sub '-', '_'
  end
end
