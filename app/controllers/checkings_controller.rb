class CheckingsController < ApplicationController
    
    def destroy 
        # instead of deleting, just change boolean to be false to make account inactive. 
        @checking = Checking.find_by(id: params[:id])
        @checking.update(status:!@checking.status)
    end

    def deposit
        @checking = Checking.find_by(id:params[:checkingId])
        @checking.deposit(params[:amount])
        @user = User.find_by(id:@checking.user.id)
        trans_date = Time.now.strftime("%m/%d/%Y") 
        @transaction = Transaction.create(amount:params[:amount], trans_type:'Deposit',date:trans_date, accountable_id:@checking.id, accountable_type:'Checking', description:'Online Deposit')
        render json: @user 
    end

    def withdrawal
        @checking = Checking.find_by(id:params[:checkingId])
        @checking.withdrawal(params[:amount])
        @user = User.find_by(id:@checking.user.id)
        @transaction = Transaction.create(amount:params[:amount], trans_type:'Withdrawal', accountable_id:@checking.id, accountable_type:'Checking', description:'Online Withdrawal')
        render json: @user
    end


    def instant_transfer
        # Find both user account, and through associations find their checking accs, then call class methods to update funds.
        @user = User.find_by(id: [params[:id_from]]) 
        @sending_user = User.find_by(id:params[:id_from])
        @sending_user_checking = Checking.find_by(id:@sending_user.id)
        
        @receiving_user = User.find_by(id:params[:id_to])
        @receiving_user_checkingAcc = Checking.find_by(id: @receiving_user.id)
        @transfer_amount = params[:amount]
        @receiving_user_checkingAcc.deposit(@transfer_amount)
        @sending_user_checking.withdrawal(@transfer_amount)
        trans_date = Time.now.strftime("%m/%d/%Y") 
        @transaction = Transaction.create(amount:params[:amount], date:trans_date, trans_type:'Transfer', accountable_id:@sending_user_checking.id, accountable_type:'Checking', description:'Online Transfer Out')
        @transaction = Transaction.create(amount:params[:amount], date:trans_date, trans_type:'Transfer', accountable_id:@receiving_user_checkingAcc.id, accountable_type:'Checking', description:'Online Transfer In')
        render json: @user
    end

end
