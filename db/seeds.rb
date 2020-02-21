User.destroy_all
Checking.destroy_all
Saving.destroy_all
Transaction.destroy_all

puts 'seeding'

user1 = User.create(username:'rex', password:'rexye')
checking1 = Checking.create(acc_num:123456, user_id:user1.id)
saving1 = Saving.create(acc_num:555555, user_id:user1.id)

Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:250, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:350, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')

Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
puts 'seeded'

