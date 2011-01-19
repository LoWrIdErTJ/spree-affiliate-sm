class UrlFormatValidator < ActiveModel::EachValidator
  sub = '([_a-z\d\-]+(\.[_a-z\d\-]+)+)'
  domain = '(([_a-z\d\-\\\.\/]+[_a-z\d\-\\\/])+)'
  URL_REGEX = /^#{sub}#{domain}*/

  def validate_each(object, attribute, value)
    unless value.blank? or value =~ URL_REGEX
      object.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end

end