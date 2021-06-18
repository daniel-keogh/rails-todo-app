Given /the following todos exist/ do |todos_table|
  todos_table.hashes.each do |todo|
    Todo.create(todo)
  end
end

Then /the category of "(.*)" should be "(.*)"/ do |title, category|
  Todo.where(title: title).first.category == category
end
