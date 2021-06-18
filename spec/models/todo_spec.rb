require 'rails_helper'

describe Todo do
  describe 'the given todo has no category' do
    it 'should return nil' do
      expect(Todo.where_category('')).to eq(nil)
      Todo.where_category('')
    end
  end

  describe 'the given todo has a category' do
    let(:fake_1) { Todo.create!(id: 1, title: 'Buy bread', category: 'Shopping') }
    let(:fake_2) { Todo.create!(id: 2, title: 'Buy Milk', category: 'Shopping') }
    let(:fake_3) { Todo.create!(id: 3, title: 'Complete assignment') }

    it 'should search the todo\'s by category' do
      expect(Todo).to receive(:where).with(category: fake_1.category)
      Todo.where_category(fake_1.category)
    end

    it 'should return other todos in that category' do
      expect(Todo.where_category(fake_1.category)).to include fake_2
    end

    it 'should not return todos that are not in that category' do
      expect(Todo.where_category(fake_1.category)).to_not include fake_3
    end
  end
      
  describe 'filtering todos by status' do
    let(:fake_1) { Todo.create!(id: 1, title: 'Buy bread', status: 'Done', category: 'Shopping') }
    let(:fake_2) { Todo.create!(id: 2, title: 'Buy Milk', status: 'Done', category: 'Shopping') }
    let(:fake_3) { Todo.create!(id: 3, title: 'Complete assignment', status: 'In Progress') }
      
    it 'should search the todo\'s by the given status' do
      expect(Todo).to receive(:where).with(status: fake_1.status)
      Todo.with_status(fake_1.status)
    end
      
    it 'should return todos with that status' do
      expect(Todo.with_status(fake_1.status)).to include fake_2
    end
      
    it 'should not return todos that don\'t have that status' do
      expect(Todo.with_status(fake_1.status)).to_not include fake_3
    end
  end
    
  describe 'getting the list of all possible statuses' do
    it 'should return them in an array' do
      expect(Todo.all_statuses).to eq ['Due', 'In Progress', 'Done']
    end
  end
end
