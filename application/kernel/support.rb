# frozen_string_literal: true

require 'erb'
require 'json'
module Drawsheep
  module Support
    ##
    # la classe qui s'occupe des informations générales
    #
    class Info
      class << self
        ##
        # recupèrer et parser les informations
        #
        def get
          JSON.parse(File.read('./package.json'), symbolize_names: true)
        end
      end
    end

    ##
    # la classe qui s'occupe de "help"
    #
    class Help
      ##
      # Génère et retourne le texte d'aide
      # Return: String
      #
      def self.generate_help(command)
        if command.present?
          generate_text_command command
        else
          genetate_full_text
        end
      end

      class << self
        ##
        # Generer le texte d'une commande précise
        #
        def generate_text_command(command)
          SlackRubyBot::Commands::Support::Help.instance.command_full_desc(command)
        end

        ##
        # Generer le texte de l'aide pour slack
        #
        def genetate_full_text
          template.result_with_hash(
            info: Support::Info.get,
            other_commands_descs: SlackRubyBot::Commands::Support::Help.instance.other_commands_descs
          )
        end

        private

        ##
        # Le template du texte
        #
        def template
          ERB.new(File.read('./views/help.slack.erb'))
        end
      end
    end
  end
end
