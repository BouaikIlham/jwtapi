class UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid?
            toke = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: { error: 'invalid username of password'}, status: :unprocessable_entity
        end

    end

    private

   def user_params
        params.permit(:username, :password)
   end
end