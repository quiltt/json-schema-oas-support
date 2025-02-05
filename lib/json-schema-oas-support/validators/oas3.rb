# frozen_string_literal: true

module JSON
  class Schema
    class Oas3 < Draft4
      def initialize
        super
        @attributes = @attributes.merge('type' => JSON::Schema::TypeOasAttribute)
        @uri = JSON::Util::URI.parse(
          'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json'
        )
        @names = ['oas3', 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json']
        @metaschema_name = 'oas3.json'
      end

      def metaschema
        resources = File.expand_path('../../../../resources', __FILE__)
        File.join(resources, @metaschema_name)
      end

      JSON::Validator.register_validator(self.new)
    end
  end
end
