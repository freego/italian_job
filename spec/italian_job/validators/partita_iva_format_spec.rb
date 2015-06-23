require "spec_helper"

describe "partita_iva_validator" do

  before(:each) do
    @user = User.new
  end

  context "with no value" do

    it "is invalid" do
      @user.should_not be_valid
    end

    it "has an error" do
      @user.should have(1).errors_on(:partita_iva)
    end

    it "returns an empty error" do
      @user.should_not be_valid
      @user.errors[:partita_iva].should == [I18n.translate("activerecord.errors.partita_iva.empty")]
    end

  end


  VALID_PARTITA_IVA_CODES.each do |code|
    context "with the valid code #{code}" do
      it "has no errors" do
        @user.partita_iva = code
        @user.should have(:no).errors_on(:partita_iva)
      end
    end
  end

  INVALID_PARTITA_IVA_CODES.each do |code|

    context "with the invalid code #{code}" do

      it "has an error" do
        @user.partita_iva = code
        @user.should have(1).error_on(:partita_iva)
      end

      it "returns an invalid_format error" do
        @user.partita_iva = code
        @user.should_not be_valid
        @user.errors[:partita_iva].should == [I18n.translate("activerecord.errors.partita_iva.invalid_format")]
      end


    end
  end

end
