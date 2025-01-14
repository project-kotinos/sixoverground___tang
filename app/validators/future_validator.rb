class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    if record[attribute] < Time.now
      record.errors[attribute] << (options[:message] || "must be in the future.")
    end
  end
end