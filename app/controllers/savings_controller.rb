class SavingsController < ApplicationController

    def destroy 
        # byebug 
        @saving = Saving.find_by(id: params[:id])
        @saving.destroy
        # @saving = Saving.find_by(id:params[:id])
        # @saving.destroy 
        render json: @saving
    end

    def update
        # internal transfer from saving to checking 
        # <ActionController::Parameters {"amount"=>"599", "checkingId"=>10, "savingId"=>1, 
        #     "controller"=>"savings", "action"=>"update", "id"=>"1", "saving"=>{}} permitted: false>
        @amount = params[:amount]
        @saving = Saving.find_by(id:[params[:id]])
        @user = User.find_by(id:[@saving.user.id])
        # byebug 
        @checking = Checking.find_by(id:@user.checking.id)
        @saving.withdrawal(@amount)
        @checking.deposit(@amount)
        trans_date = Time.now.strftime("%m/%d/%Y")
        @transaction = Transaction.create(amount:params[:amount], date:trans_date, trans_type:'Transfer', accountable_id:@checking.id, accountable_type:'Checking', description:'Online Internal Transfer')

        render json:@user
    end
    


end
