User.destroy_all
Checking.destroy_all
Saving.destroy_all
Transaction.destroy_all

# puts 'seeding'
# user1 = User.create(username:'rex', password:'rexye')
# checking1 = Checking.create(acc_num:123456, user_id:user1.id)
# saving1 = Saving.create(acc_num:555555, user_id:user1.id)
# Transaction.create(amount:rand 100..200, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:250, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:350, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:checking1.id, accountable_type:'Checking')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')
# Transaction.create(amount:150, trans_type:'debit', accountable_id:saving1.id, accountable_type:'Saving')

puts 'seeded'

# def randomAmount
#     rand 100..200 
# end

# restaurants = [
# "Gotham Bar and Grill",
# "Gramercy Tavern",
# "Gray's Papaya",
# "La Grenouille",
# "Guss' Pickles",
# "H&H Bagels",
# "The Halal Guys",
# "Hallo Berlin",
# "IDT Megabite Cafe",
# "J.G. Melon",
# "Jean Georges",
# "Joe Allen",
# "Joe's Shanghai",
# "Julius",
# "Katz's Delicatessen",
# "Keens Steakhouse",
# "Kiev Restaurant",
# "King's Carriage House",
# "Kossar's Bialys",
# "Lindy's",
# "Lombardi's Pizza",
# "Lusardi's",
# "Magnolia Bakery"
# ]

# descriptions = [
#     "ATM withdrwal, code #{10.times.map{rand(5)}.join}",
#     "ATM deposit, code #{10.times.map{rand(5)}.join}",
#     "#{['Lunch', 'Diner', "Breakfast", "Brunch"].sample} at #{restaurants.sample} restaurant."
# ]


# 30.times do 
#     Transaction.create(amount: randomAmount(),
#          trans_type:['debit','credit'].sample, 
#          accountable_id:1, 
#          accountable_type:'Checking',
#          description:descriptions.sample)
# end

