class MembersController < ApplicationController
  before_action :all_members, only: [:index, :create, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  include MembersHelper

  def ajax
  end

  def team_view
    @teams = team_assign(params[:size])    
    @members = Member.order(:team)
    @team_names = ["Sinister Blade", "Humanity", "Divine Elegence", "Heirs of the Sun", "Eliminator", "Arcane Fire", "Beryllium", "Cognitive Dissonance", "End Love", "Outlaw Gun", "Error 404", "Primal Rage", "Hope of Glory", "Reflective Hearts", "Grey Cell", "Undefined Method", "Wyrm", "Midnight Sun", "Double Echo", "Third Estate", "Nova Corps", "Obtenebration", "Cup of Kings", "Ten Foot Pole", "Liquid Rain", "Shining Alma", "Network Node","Delicate Fist", "Chronolock", "Terminal Button"]
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.create(member_params)
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @member.update(member_params)
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
  end

  private
    def all_members
      @members = Member.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :team, :leader)
    end
end
