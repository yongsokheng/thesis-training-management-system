Rails.application.eager_load!
$model_classes = Hash[ActiveRecord::Base.descendants
                  .collect{|c| [c.name, c.table_name]}]
                  .reject!{|name| name.include? "::"}.keys
