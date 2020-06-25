class UsersController < ApplicationController
   def index
     @users = User.all
     render
   end
   def add_user
   end
   def delete_user
   end
end
