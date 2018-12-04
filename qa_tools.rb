require 'selenium-webdriver'

class My_Store_Signup

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @home_url = 'http://automationpractice.com/index.php'
    @login_button_class = 'login'
    @create_acc_feild_id = 'create-account_form'
    @create_acc_button_name = 'SubmitCreate'
    @email_create_input_id = 'email_create'
    @create_acc_error_id = 'create_account_error'
    @account_creation_form_id = 'account-creation_form'
    @current_year = DateTime.now.year
    puts @current_year
  end

  def get_driver
    @chrome_driver
  end

  def visit_home_page
    @chrome_driver.get(@home_url)
  end

  def current_url
    @chrome_driver.current_url
  end

  def click_login_button
    @chrome_driver.find_element(:class, @login_button_class).click
  end

  def create_acc_feild_exists?
    if(@chrome_driver.find_element(:id, @create_acc_feild_id))
      true
    else
      false
    end
  end

  def click_create_acc_button
    @chrome_driver.find_element(:name, @create_acc_button_name).click
  end

  def enter_email_address (input)
    @chrome_driver.find_element(:id, @email_create_input_id).send_keys (input)
  end

  def get_create_email_error_text
    a = @chrome_driver.find_element(:id, @create_acc_error_id)
    b = a.find_element(:tag_name, 'ol')
    b.find_element(:tag_name, 'li').text
  end

  def clear_email_feild
    @chrome_driver.find_element(:id, @email_create_input_id).clear
  end

  def account_creation_form_visible?
    @chrome_driver.find_element(:id, @account_creation_form_id).displayed?
  end

  # filling in the account creation form
  def select_title(oneOrTwo)
    @chrome_driver.find_element(:id, "id_gender#{oneOrTwo}").click
  end

  def enter_firstname(firstname)
    @chrome_driver.find_element(:id, "customer_firstname").send_keys firstname
  end

  def enter_lastname(lastname)
    @chrome_driver.find_element(:id, "customer_lastname").send_keys lastname
  end

  def enter_password(password)
    @chrome_driver.find_element(:id, "passwd").send_keys password
  end

  def select_date(day, month, year)
    days = @chrome_driver.find_element(:id, "days")
    days.click
    days.find_elements(:tag_name, 'option')[day].click
    months = @chrome_driver.find_element(:id, "months")
    months.click
    months.find_elements(:tag_name, 'option')[month].click
    years = @chrome_driver.find_element(:id, "years")
    years.click
    years.find_elements(:tag_name, 'option')[(@current_year+1)-year].click
  end

  def enter_address_1(address)
    @chrome_driver.find_element(:id, "address1").send_keys address
  end

  def enter_city(city)
    @chrome_driver.find_element(:id, "city").send_keys city
  end

  def choose_state(state)
    #click state drop down, get array options, match parameter to array & take index, choose relevant option
  end
end
