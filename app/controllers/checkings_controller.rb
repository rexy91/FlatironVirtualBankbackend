class CheckingsController < ApplicationController
    def destroy 
        # instead of deleting, just change boolean to be false to make account inactive. 
        @checking = Checking.find_by(id: params[:id])
        @checking.update(status:!@checking.status)
        byebug 
    end

end
