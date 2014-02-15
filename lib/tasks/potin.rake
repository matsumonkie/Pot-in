namespace :potin do

  desc "re calculate all balance account"
  task balance: :environment do
    Account.delete_all
    
    User.all.each do |user|
      contacts = user.contacts
      contacts.each do |contact|
        credits = Payment.where(creditor_id: user.id, debitor_id: contact.id).pluck(:amount).sum
        debits  = Payment.where(creditor_id: contact.id, debitor_id: user.id).pluck(:amount).sum
        account = Account.create(user_id: user.id, contact_id: contact.id, balance: credits - debits)
      end
    end
  end
end
