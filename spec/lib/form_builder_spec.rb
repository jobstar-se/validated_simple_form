require "spec_helper"

describe ValidatedSimpleForm::FormBuilder do
  it "should do sth" do
    @user       = User.new
    @controller = UsersController.new
    @builder    = ValidatedSimpleForm::FormBuilder.new(:user, @user, @controller, {}, nil)

    @builder.text_field(:name, :validate => true).should match(/class="validated"/)
  end
end
