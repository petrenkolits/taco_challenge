class ApplicationController < ActionController::API
  class << self
    def render_interactions(*actions)
      actions.each do |action|
        define_method(action) do
          render_interaction(
            "#{self.class.name.sub(/Controller$/, '')}::#{action.to_s.titleize}".constantize
          )
        end
      end
    end
  end

  def render_interaction(
    klass,
    success: -> int { render json: int.result },
    failure: -> int { render json: {statusText: int.errors.full_messages.join("\n")}, location: false, status: :unprocessable_entity }
  )
    interaction = klass.run(interaction_params)
    (interaction.valid? ? success : failure)[interaction]
  end

  def interaction_params
    params.permit!.to_h.deep_transform_keys(&:underscore)
  end
end
