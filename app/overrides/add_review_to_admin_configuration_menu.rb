Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                      :name => "add_reviews_to_configuration_menu",
                      :insert_after => "[data-hook='admin_configurations_menu']",
                      :partial => "spree/admin/shared/configurations_menu",
                      :disable => false)
