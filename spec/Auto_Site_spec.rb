describe 'testing the Automation sites registration page' do

  before(:all) do
    @driver_class = Auto_Site.new
    @driver_class.visit_auto_form
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    @one_or_two = rand(1..2)
    @customer_firstname = 'Steve'
    @customer_lastname = 'Stevenson'
    @password = 'Steve_84'
    @firstname = 'Steve'
    @lastname = 'Stevenson'
    @company = 'Steven_inc'
    @address1 = '32 Steven Road'
    @address2 = 'Steveslvania'
    @city = 'Detroit'
    @postcode = 'DE11 5ST'
    @other = 'Just a bunch of sample text'
    @phone = '01234 000001'
    @phone_mobile = '07000 000001'
    @alias = 'Chez Steve'
    @dob_day = rand(1..31).to_s
    @dob_month = rand(1..12).to_s
    @dob_year = rand(1900..2018).to_s
    @state = 'Michigan'
    @country = 'United States'
  end

  it "should land on the homepage" do
    expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php'
  end

  it "should go to the signup page" do
    @driver_class.go_from_home_to_sign_up
    sleep 2
    expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account'
  end

  it "should return an error message when an invalid email is entered" do
    @driver_class.enter_invalid_email
    @driver_class.click_create_account
    sleep 1
    expect(@driver_class.check_invlid_message.text).to eq 'Invalid email address.'
    sleep 1
  end

  it "should correctly go to the registration page when a valid email is entered" do
    @driver_class.clear_box_with_id('email_create')
    sleep 1
    @driver_class.enter_valid_email
    sleep 1
    @driver_class.click_create_account
    sleep 3
    expect(@driver_class.current_url).to eq 'http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation'
  end

  it "should enter a gender" do
    @driver_class.select_gender(@one_or_two)
    expect(@driver_class.is_gender_selected?(@one_or_two)).to eq true
  end

  it "should correctly enter into the firstname box" do
    @driver_class.give_text_to('customer_firstname', @customer_firstname)
    expect(@driver_class.check_text_of('customer_firstname')).to eq @customer_firstname
  end

  it "should correctly enter into the lastname box" do
    @driver_class.give_text_to('customer_lastname', @customer_lastname)
    expect(@driver_class.check_text_of('customer_lastname')).to eq @customer_lastname
  end

  it "should correctly enter into the password box" do
    @driver_class.give_text_to('passwd', @password)
    expect(@driver_class.check_text_of('passwd')).to eq @password
  end

  it "should correctly enter the dob_day" do
    @driver_class.select_option_by_value_from('days', @dob_day)
    expect(@driver_class.check_selection_by_value_for('days')).to eq @dob_day
  end

  it "should correctly enter the dob_month" do
    @driver_class.select_option_by_value_from('months', @dob_month)
    expect(@driver_class.check_selection_by_value_for('months')).to eq @dob_month
  end

  it "should correctly enter the dob_year" do
    @driver_class.select_option_by_value_from('years', @dob_year)
    expect(@driver_class.check_selection_by_value_for('years')).to eq @dob_year
  end

  it "should tick and untick the newsletter box" do
    @driver_class.select_box_with_id('newsletter')
    expect(@driver_class.check_if_clicked('newsletter')).to eq true
    @driver_class.select_box_with_id('newsletter')
    expect(@driver_class.check_if_clicked('newsletter')).to eq false
  end

  it "should tick and untick the opt-in box" do
    @driver_class.select_box_with_id('optin')
    expect(@driver_class.check_if_clicked('optin')).to eq true
    @driver_class.select_box_with_id('optin')
    expect(@driver_class.check_if_clicked('optin')).to eq false
  end

  it "should correctly enter into the second firstname box" do
    @driver_class.clear_box_with_id('firstname')
    @driver_class.give_text_to('firstname', @firstname)
    expect(@driver_class.check_text_of('firstname')).to eq @firstname
  end

  it "should correctly enter into the second lastname box" do
    @driver_class.clear_box_with_id('lastname')
    @driver_class.give_text_to('lastname', @lastname)
    expect(@driver_class.check_text_of('lastname')).to eq @lastname
  end

  it "should correctly enter into the company box" do
    @driver_class.give_text_to('company', @company)
    expect(@driver_class.check_text_of('company')).to eq @company
  end

  it "should correctly enter into the address1 box" do
    @driver_class.give_text_to('address1', @address1)
    expect(@driver_class.check_text_of('address1')).to eq @address1
  end

  it "should correctly enter into the address2 box" do
    @driver_class.give_text_to('address2', @address2)
    expect(@driver_class.check_text_of('address2')).to eq @address2
  end

  it "should correctly enter into the city box" do
    @driver_class.give_text_to('city', @city)
    expect(@driver_class.check_text_of('city')).to eq @city
  end

  it "should correctlt select a state" do
    @driver_class.select_option_by_text_from('id_state', @state)
    expect(@driver_class.check_selection_by_text_for('id_state')).to eq @state
  end

  it "should correctly enter into the postcode box" do
    @driver_class.give_text_to('postcode', @postcode)
    expect(@driver_class.check_text_of('postcode')).to eq @postcode
  end

  it "should correctlt select a country" do
    @driver_class.select_option_by_text_from('id_country', @country)
    expect(@driver_class.check_selection_by_text_for('id_country')).to eq @country
  end

  it "should correctly enter into the other box" do
    @driver_class.give_text_to('other', @other)
    expect(@driver_class.check_text_of('other')).to eq @other
  end

  it "should correctly enter into the phone box" do
    @driver_class.give_text_to('phone', @phone)
    expect(@driver_class.check_text_of('phone')).to eq @phone
  end

  it "should correctly enter into the mobile phone box" do
    @driver_class.give_text_to('phone_mobile', @phone_mobile)
    expect(@driver_class.check_text_of('phone_mobile')).to eq @phone_mobile
  end

  it "should correctly enter into the alias box" do
    @driver_class.clear_box_with_id('alias')
    @driver_class.give_text_to('alias', @alias)
    expect(@driver_class.check_text_of('alias')).to eq @alias
    sleep 10
  end

end
