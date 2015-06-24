require "active_model"
require "italian_job/validators/codice_fiscale_format"
require "italian_job/validators/partita_iva_format"

module ItalianJob
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
