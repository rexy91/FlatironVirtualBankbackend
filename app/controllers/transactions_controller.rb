class TransactionsController < ApplicationController
    
    def index
        @transactions = Transaction.all
        render json:@transactions
    end 

def expenseSummary
        @user = User.find_by(id:params[:id])
        @user_trans = @user.checking.transactions
        deposit_total = 0
        withdrawal_total = 0
        transfer_total = 0
        food_total = 0
        gas_total = 0
        
        @user_trans.each do |transaction|
            if transaction.trans_type = 'Withdrawal'
                withdrawal_total += transaction.amount
            elsif transaction.trans_type == 'Deposit'
                    byebug 
                deposit_total += transaction.amount
            elsif transaction.trans_type = 'Transfer'
                transfer_total += transaction.amount
            elsif transaction.trans_type = 'Food'
                food_total += transaction.amount
            else
                gas_total += transaction.amount
            end 
        end
            byebug 
    end
end 
