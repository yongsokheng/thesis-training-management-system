$model_classes = (ActiveRecord::Base.connection.tables - %w[schema_migrations activities ckeditor_assets])
                   .map{|model| model.classify.constantize}
