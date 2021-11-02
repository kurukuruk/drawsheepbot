# frozen_string_literal: true

module Drawsheep
  module Support
    class Help
      def self.generate_help(command)
        if command.present?
          generate_text_command command
        else
          genetate_text
        end
      end

      def self.generate_text_command(command)
        SlackRubyBot::Commands::Support::Help.instance.command_full_desc(command)
      end

      def self.genetate_text
        other_commands_descs = SlackRubyBot::Commands::Support::Help.instance.other_commands_descs
        <<~TEXT
          *DrawsheepBot*
          _Dessine moi un mouton._

          *voir:* https://github.com/kurukuruk/drawsheepbot

          #{(['*commandes:*'] + other_commands_descs).join("\n- ")}
          Pour obtenir les informations à propos d'une commande: *help <command>*
        TEXT
      end
    end
  end
end
