##
# This is a list of the available configuration options for Typus and 
# their defaults. Update them to fit your application needs.
##

=begin

# Options

  Typus::Configuration.options[:per_page] = 15
  Typus::Configuration.options[:form_rows] = 10
  Typus::Configuration.options[:sidebar_selector] = 10
  Typus::Configuration.options[:minute_step] = 5
  Typus::Configuration.options[:email] = 'admin@example.com'
  Typus::Configuration.options[:toggle] = true
  Typus::Configuration.options[:edit_after_create] = true
  Typus::Configuration.options[:root] = 'admin'
  Typus::Configuration.options[:recover_password] = true
  Typus::Configuration.options[:special_characters_on_password] = false
  Typus::Configuration.options[:ssl] = false
  Typus::Configuration.options[:icon_on_boolean] = false

# Experimental options: (don't use them in production)

  Typus::Configuration.options[:actions_on_table] = false

=end

Typus::Configuration.options[:app_name] = "<%= application %>"