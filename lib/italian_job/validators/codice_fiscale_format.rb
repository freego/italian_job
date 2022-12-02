module ActiveModel
  module Validations
    class CodiceFiscaleFormatValidator < ActiveModel::EachValidator
      REGEX = Regexp.compile("^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$")

      DISPARI = [1, 0, 5, 7, 9, 13, 15, 17, 19, 21, 1, 0, 5, 7, 9, 13, 15, 17, 19, 21, 2, 4, 18, 20, 11, 3, 6, 8, 12, 14, 16, 10, 22, 25, 24, 23]

      def validate_each(object, attribute, value)
        unless control_code_valid?(value)
          object.errors.add(attribute, message: I18n.t("activerecord.errors.codice_fiscale.invalid_format"))
        end
      end

      private

      def control_code_valid?(value)
        return true if value.blank?
        return false unless value.match(REGEX)

        odds, evens = [], []
        value[0..14].split('').each_with_index {|e,i| (i+1).odd? ? odds << e : evens << e}
        odd = odds.inject(0) { |sum, current_char| sum + DISPARI[(current_char.ord < 65 ? current_char.to_i : ((current_char.ord - 54)-1))] }
        even = evens.inject(0) { |sum, current_char| sum + (current_char.ord < 65 ? current_char.to_i : current_char.ord - 65) }
        ( ((odd + even) % 26) + 65).chr == value[15].chr
      end
    end
  end
end
