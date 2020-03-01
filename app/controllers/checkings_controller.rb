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
        @transaction = Transaction.create(amount:params[:amount], trans_type:'Deposit', accountable_id:@checking.id, accountable_type:'Checking', description:'Online Deposit')
        render json: @user 
    end

    def withdrawal
        @checking = Checking.find_by(id:params[:checkingId])
        @checking.withdrawal(params[:amount])
        @user = User.find_by(id:@checking.user.id)
        @transaction = Transaction.create(amount:params[:amount], trans_type:'Withdrawl', accountable_id:@checking.id, accountable_type:'Checking', description:'Online Withdrawal')
        render json: @user
    end

end
