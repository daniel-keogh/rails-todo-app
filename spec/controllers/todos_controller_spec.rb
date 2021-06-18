require 'rails_helper'

describe TodosController do
  before {
    Todo.create!(id: 1, title: 'Buy bread', category: 'Shopping')
    Todo.create!(id: 2, title: 'Complete assignment', category: '')
  }

  describe 'the given todo has no category' do  
    it 'should redirect to the home page' do
      get :category, { id: 2 }
      expect(response).to redirect_to '/todos'
    end
  end
    
  describe 'the given todo has a category' do
    it 'should search the model by the category name' do
      expect(Todo).to receive(:where_category).with('Shopping')
      get :category, { id: 1 }
    end
      
    it 'should save todos in the category to an instance variable' do
      @results = [double('Todo'), double('Todo')]
      allow(Todo).to receive(:where_category).and_return(@results)
      get :category, { id: 1 }
      expect(assigns(:same_category)).to eq(@results)
    end
      
    it 'should render the categories view' do
      get :category, { id: 1 }
      expect(response).to render_template 'category'
    end
  end
    
  describe 'getting all the todos' do      
    it 'should assign the todos to an instance variable' do
      get :index
      expect(assigns(:todos)).to_not eq nil
    end
      
    it 'should assign the orderBy param to an instance variable' do
      get :index, {orderBy: 'title', orderDir: 'desc'}
      expect(assigns(:orderBy)).to eq 'title'
    end
  end
    
  describe 'creating a new todo' do
    it 'should call new on the model' do
      expect(Todo).to receive(:new)
      post :new
    end
  end
    
  describe 'showing a todo\'s details' do
    let(:fake_1) { Todo.create!(id: 3, title: 'Do some stuff') }
    
    it 'should render the show view' do
      get :show, { todo: { title: fake_1.title }, id: fake_1.id }
      expect(response).to render_template 'show'
    end
  end
    
  describe 'editing a todo' do 
    it 'should search the model by the todo\'s ID' do
      expect(Todo).to receive(:find).with("1")
      get :edit, { id: 1 }
    end
  end
    
  describe 'updating a todo' do
    let(:fake_1) { Todo.create!(id: 3, title: 'Do some stuff') }
      
    it 'should redirect to the details page' do
      patch :update, { todo: { title: fake_1.title }, id: fake_1.id }
      expect(response).to redirect_to ('/todos/' + fake_1.id.to_s)
    end
  end
    
  describe 'deleting a todo' do
    it 'should remove the todo from the database' do
      delete :destroy, { id: 1 }
      expect { Todo.find("1") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
