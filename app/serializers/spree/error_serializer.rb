module Spree
  class ErrorSerializer
    attr_accessor :resource, :options

    def initialize(resource, options = {})
      @resource = resource
      @options = options
    end

    def as_json
      { errors: error_messages }.to_json
    end

    private

    def resource_error_objects(messages)
      messages.map do |title, detail|
        pointer = "data/attributes/#{title.to_s.split('.').join('/')}"
        error_object title.to_s.gsub('.', ' '), detail.to_sentence, pointer: pointer
      end
    end

    def error_messages
      case resource
      when Symbol
        title_translation = Spree.t("api.errors.#{resource}.title")
        detail_translation = Spree.t("api.errors.#{resource}.detail")
        [error_object(title_translation, detail_translation)]
      when Array
        resource.map { |errors| resource_error_objects errors }.flatten
      else
        resource_error_objects resource.errors.messages
      end
    end

    def error_object(title, detail, pointer: '')
      error = {
        detail: detail.gsub("\n", ' ').strip,
        meta: options,
        title: title.to_s.titleize
      }

      pointer.present? ? error.merge(pointer: pointer) : error
    end
  end
end
