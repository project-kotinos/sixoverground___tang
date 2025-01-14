require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

module Tang
  RSpec.describe Admin::PlansController, type: :controller do
    before { StripeMock.start }
    after { StripeMock.stop }
    routes { Tang::Engine.routes }

    login_admin

    # This should return the minimal set of attributes required to create a valid
    # Plan. As you add validations to Plan, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      # skip("Add a hash of attributes valid for your model")
      FactoryBot.attributes_for(:plan)
    }

    let(:invalid_attributes) {
      # skip("Add a hash of attributes invalid for your model")
      FactoryBot.attributes_for(:plan, name: nil)
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # PlansController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all plans as @plans" do
        plan = Plan.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:plans)).to eq([plan])
      end
    end

    describe "GET #show" do
      it "assigns the requested plan as @plan" do
        plan = Plan.create! valid_attributes
        get :show, {id: plan.to_param}, session: valid_session
        expect(assigns(:plan)).to eq(plan)
      end
    end

    describe "GET #new" do
      it "assigns a new plan as @plan" do
        get :new, params: {}, session: valid_session
        expect(assigns(:plan)).to be_a_new(Plan)
      end
    end

    describe "GET #edit" do
      it "assigns the requested plan as @plan" do
        plan = Plan.create! valid_attributes
        get :edit, {id: plan.to_param}, session: valid_session
        expect(assigns(:plan)).to eq(plan)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Plan" do
          expect {
            post :create, {plan: valid_attributes}, session: valid_session
          }.to change(Plan, :count).by(1)
        end

        it "assigns a newly created plan as @plan" do
          post :create, {plan: valid_attributes}, session: valid_session
          expect(assigns(:plan)).to be_a(Plan)
          expect(assigns(:plan)).to be_persisted
        end

        it "redirects to the created plan" do
          post :create, {plan: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_plan_url(Plan.last))
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved plan as @plan" do
          post :create, {plan: invalid_attributes}, session: valid_session
          expect(assigns(:plan)).to be_a_new(Plan)
        end

        it "re-renders the 'new' template" do
          post :create, {plan: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          # skip("Add a hash of attributes valid for your model")
          FactoryBot.attributes_for(:plan, name: 'Changed Plan')
        }

        it "updates the requested plan" do
          plan = Plan.create! valid_attributes
          put :update, {id: plan.to_param, plan: new_attributes}, session: valid_session
          plan.reload
          # skip("Add assertions for updated state")
          expect(plan.name).to eq('Changed Plan')
        end

        it "assigns the requested plan as @plan" do
          plan = Plan.create! valid_attributes
          put :update, {id: plan.to_param, plan: valid_attributes}, session: valid_session
          expect(assigns(:plan)).to eq(plan)
        end

        it "redirects to the plan" do
          plan = Plan.create! valid_attributes
          put :update, {id: plan.to_param, plan: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin_plan_url(plan))
        end
      end

      context "with invalid params" do
        it "assigns the plan as @plan" do
          plan = Plan.create! valid_attributes
          put :update, {id: plan.to_param, plan: invalid_attributes}, session: valid_session
          expect(assigns(:plan)).to eq(plan)
        end

        it "re-renders the 'edit' template" do
          plan = Plan.create! valid_attributes
          put :update, {id: plan.to_param, plan: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested plan" do
        plan = Plan.create! valid_attributes
        expect {
          delete :destroy, {id: plan.to_param}, session: valid_session
        }.to change(Plan, :count).by(-1)
      end

      it "redirects to the plans list" do
        plan = Plan.create! valid_attributes
        delete :destroy, {id: plan.to_param}, session: valid_session
        expect(response).to redirect_to(admin_plans_url)
      end
    end

  end
end
