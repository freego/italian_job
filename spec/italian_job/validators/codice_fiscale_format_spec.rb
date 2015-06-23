require "spec_helper"

describe "codice_fiscale_validator" do

  before(:each) do
    @user = User.new
  end

  context "with no value" do

    it "is invalid" do
      @user.should_not be_valid
    end

    it "has an error" do
      @user.should have(1).errors_on(:codice_fiscale)
    end

    it "returns an empty error" do
      @user.should_not be_valid
      @user.errors[:codice_fiscale].should == [I18n.translate("activerecord.errors.codice_fiscale.empty")]
    end

  end


  VALID_CODICE_FISCALE_CODES.each do |code|
    context "with the valid code #{code}" do
      it "has no errors" do
        @user.codice_fiscale = code
        @user.should have(:no).errors_on(:codice_fiscale)
      end
    end
  end

  INVALID_CODICE_FISCALE_CODES.each do |code|

    context "with the invalid code #{code}" do

      it "has an error" do
        @user.codice_fiscale = code
        @user.should have(1).error_on(:codice_fiscale)
      end

      it "returns an invalid_format error" do
        @user.codice_fiscale = code
        @user.should_not be_valid
        @user.errors[:codice_fiscale].should == [I18n.translate("activerecord.errors.codice_fiscale.invalid_format")]
      end


    end
  end

end
