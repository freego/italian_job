ActiveRecord::Schema.define(:version => 0) do

  create_table "users", :force => true do |t|
    t.string   "email"                               
    t.string "codice_fiscale"
    t.string "partita_iva"
  end
  
end
