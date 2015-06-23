module ActiveModel
    module Validations
        class PartitaIvaFormatValidator < ActiveModel::EachValidator
            REGEX=Regexp.compile("^[0-9]{11}$")


            def validate_each(object, attribute, value)
                if value.blank?
                    object.errors[attribute] << I18n.translate("activerecord.errors.partita_iva.empty")
                    return
                end
                unless value.match(REGEX)
                    object.errors[attribute] << I18n.translate("activerecord.errors.partita_iva.invalid_format")
                    return
                end
                unless control_code_valid?(value)
                    object.errors[attribute] << I18n.translate("activerecord.errors.partita_iva.invalid_format")
                    return
                end
            end

            private
            def control_code_valid?(value)
                odds, evens = [], []
                value[0..9].split('').map(&:to_i).each_with_index {|e,i| (i+1).odd? ? odds << e : evens << e}
                x = odds.inject(0) { |sum,d| sum + d }
                y = 2 * ( evens.inject(0) { |sum,d| sum + d } )
                z = evens.select { |d| d >= 5 }.size
                t = ( x + y + z ) % 10
                value[10].chr.to_i == (10 - t) % 10
            end

        end
    end
end
