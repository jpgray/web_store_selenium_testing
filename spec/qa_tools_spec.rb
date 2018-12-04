describe "testing the myStore signup" do

  before(:all) do
    @driver_class = My_Store_Signup.new
    @driver_class.visit_home_page
    @driver_class.get_driver.manage.timeouts.implicit_wait = 100
    # @wait = Selenium::WebDriver::Wait.new(timeout: 50)
    @invalid_email = 'Mongoose Rule!'
    @valid_email = 'mongoose@rules.co.jp'
    @firstname = 'Tunnel Snakes'
    @lastname = 'Rule'
    @password = 'DefeatTheHuns'
    @day = 1
    @month = 1
    @year = 2018
    @address1 = "Backstreet Boys"
    @city = "San D A Go"
  end

  after(:each) do
    # @wait
  end

  after(:all) do
    sleep 5
  end

  it "should land on the home page" do
    expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php'
  end

  # move from home to login page

  it "should move to the login page after clicking the Sign in button" do
    @driver_class.click_login_button
    expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
    @wait
  end

  context "the login page" do

    it "should display the 'Create an account' feild" do
      expect(@driver_class.create_acc_feild_exists?).to be true
    end

    it "should remain on the login page if no email is entered" do
      @driver_class.click_create_acc_button
      expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
    end

    it "should remain on the login page if an incorrect email is entered" do
      @driver_class.enter_email_address(@invalid_email)
      @driver_class.click_create_acc_button
      expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
    end

    it "should should create an incorrect email message if an invalid email address is entered" do
      expect(@driver_class.get_create_email_error_text).to eq 'Invalid email address.'
    end

    it "should accept a valid email address and display the create an account form" do
      @driver_class.clear_email_feild
      @driver_class.enter_email_address(@valid_email)
      @driver_class.click_create_acc_button
      sleep 3
      expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation'
      expect(@driver_class.account_creation_form_visible?).to be true
    end
  end

  context "the full account creation form" do
    it "something something" do
      @driver_class.select_title(1)
      @driver_class.enter_firstname(@firstname)
      @driver_class.enter_lastname(@lastname)
      @driver_class.enter_password(@password)
      @driver_class.select_date(@day, @month, @year)
      @driver_class.enter_address_1(@address1)
      @driver_class.enter_city(@city)
    end
  end
end
