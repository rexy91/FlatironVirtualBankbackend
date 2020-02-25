class CheckingsController < ApplicationController
    def destroy 
        # instead of deleting, just change boolean to be false to make account inactive. 
        @checking = Checking.find_by(id: params[:id])

    end

end
