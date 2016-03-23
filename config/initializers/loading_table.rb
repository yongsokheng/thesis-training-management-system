$model_classes = (ActiveRecord::Base.connection.tables - %w[schema_migrations activities])
                   .map{|model| model.classify.constantize}
