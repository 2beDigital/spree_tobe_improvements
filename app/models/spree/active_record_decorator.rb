module ActiveRecord
  ActiveRecord::Base.class_eval do
    def self.to_csv()
      columnes=csv_columns
      CSV.generate do |csv|
        titols=Array.new
        columnes.each do |titol|
            titols.append(Spree.t("#{self.table_name}.#{titol}",:default=>"#{titol}"))
        end
        csv << titols
        all.each do |item|
          csv << item.attributes.values_at(*columnes)
        end
      end
    end

    def self.csv_columns
      column_names
    end
  end
end

