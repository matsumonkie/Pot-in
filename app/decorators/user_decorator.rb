class UserDecorator < Draper::Decorator
  delegate_all

  def fullname_or_email
    if object.firstname.blank? && object.lastname.blank?
      object.email
    else
      [object.firstname, object.lastname].join('. ')
    end
  end
end
