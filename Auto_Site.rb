require 'selenium-webdriver'

class Auto_Site

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @Auto_form_url = "http://automationpractice.com/index.php"
  end

  def visit_auto_form
    @chrome_driver.get(@Auto_form_url)
  end

  def current_url
    @chrome_driver.current_url
  end

  def go_from_home_to_sign_up
    @chrome_driver.find_element(:class, 'login').click
  end

  def enter_invalid_email
    @chrome_driver.find_element(:id, 'email_create').send_keys('invalid')
  end

  def enter_valid_email
    @chrome_driver.find_element(:id, 'email_create').send_keys('invalid@invalid.com')
  end

  def check_invlid_message
    box = @chrome_driver.find_element(:id, 'create_account_error')
    list = box.find_element(:tag_name, 'ol')
    list.find_element(:tag_name, 'li')
  end

  def click_create_account
    @chrome_driver.find_element(:id, 'SubmitCreate').click
  end

  def clear_box_with_id(textbox_id)
    @chrome_driver.find_element(:id, "#{textbox_id}").clear
  end

  def select_gender(one_or_two)
    @chrome_driver.find_element(:id, "id_gender#{one_or_two}").click
  end

  def is_gender_selected?(one_or_two)
    @chrome_driver.find_element(:id, "id_gender#{one_or_two}").selected?
  end

  def give_text_to(textbox_id, text)
    @chrome_driver.find_element(:id, "#{textbox_id}").send_keys("#{text}")
  end

  def check_text_of(textbox_id)
    @chrome_driver.find_element(:id, "#{textbox_id}").attribute('value')
  end

  def select_box_with_id(selector_id)
    @chrome_driver.find_element(:id, "#{selector_id}").click
  end

  def check_if_clicked(selector_id)
    @chrome_driver.find_element(:id, "#{selector_id}").selected?
  end

  def select_option_by_value_from(id, choice)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "#{id}"))
    option.select_by(:value, "#{choice}")
  end

  def check_selection_by_value_for(id)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "#{id}"))
    option.first_selected_option.attribute('value')
  end

  def select_option_by_text_from(id, choice)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "#{id}"))
    option.select_by(:text, "#{choice}")
  end

  def check_selection_by_text_for(id)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "#{id}"))
    option.first_selected_option.text
  end

end
